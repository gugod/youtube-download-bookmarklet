#!/usr/bin/env perl
use v5.14;
use Mojolicious::Lite;
use AnyEvent 5;
use AnyEvent::Worker;

my $download_worker = AnyEvent::Worker->new(
    sub {
        chdir("$ENV{HOME}/Downloads");

        my ($url) = @_;
        system(qw(youtube-dl --title), $url);
    }
);

get '/b' => sub {
    my $self = shift;
    my $host = $self->req->headers->host;

    $self->render_text(<<"BOOKMARKLET");
<html><body>
<a href='javascript:(function(){var x=document.createElement("script");var u=encodeURIComponent(location.href);x.setAttribute("id","youtube-downloader");x.setAttribute("src","http://${host}/dl.js?url="+u);document.body.appendChild(x);})();'>youtube-dl</a>
</body></html>
BOOKMARKLET
};

get '/dl.js' => sub {
    my $self = shift;
    my $youtube_url = $self->param("url");
    $download_worker->do($youtube_url, sub {});
    $self->render_text('document.body.removeChild(document.getElementById("youtube-downloader"))');
};

app->start;
