# This assumes you have all the packages you want to dependency check, cloned into the parent directory this repo is
#  cloned to.
# Output is to be used with Graphviz: http://www.webgraphviz.com/
{
  echo 'digraph G {';
  for p in ../base-* ../core-*; do
    n=$(jq -c '.name' $p/package.json);

    for d in $(jq -c '.dependencies|keys[]' $p/package.json 2>/dev/null); do
      echo '  '$n' -> '$d;
    done
  done;
  echo '}';
} > dependency-graph;
