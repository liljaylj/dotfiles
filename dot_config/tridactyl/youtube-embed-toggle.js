let urlObj = new URL(JS_ARG);

if (urlObj.hostname.toLowerCase().endsWith('youtube.com')) {
  const lcPath = urlObj.pathname.toLowerCase();
  if (lcPath.startsWith('/playlist')) {
    urlObj.pathname = '/embed/videoseries';
  }
  else if (lcPath.startsWith('/embed/videoseries')) {
    urlObj.pathname = 'playlist';
  }
  else if (lcPath.startsWith('/watch')) {
    urlObj.pathname = `/embed/${urlObj.searchParams.get('v')}`;
    urlObj.searchParams.delete('v');
  }
  else if (lcPath.startsWith('/embed')) {
    urlObj.searchParams.append('v', urlObj.pathname.split('/').pop());
    urlObj.pathname = '/watch';
  }
}

urlObj.href;
