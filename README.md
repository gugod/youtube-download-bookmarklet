# Description

This is a quick hack to download youtube video for offline viewing with one
mouse click.

# Installation

    brew install youtube-dl
    cpanm AnyEvent::Worker
    cpanm Mojolicious

# Install the bookmarklet

1. Start the app

    ./app.pl daemon
 
2. Visit http://localhost:3000/b 
3. Drag the 'youtube-dl' bookmarklet link to bookmark toolbar

# Run

1. Start the app:
    ./app.pl daemon

2. Visit some youtube.com URL
3. Click the 'youtubel-dl' bookmarklet
4. The video shall be found in ~/Downloads

# Notice

1. The downloading is done in the background and you may leave the page right away
2. It works with playlist urls
3. It either has unfound / unknown bugs or no bugs at all.
