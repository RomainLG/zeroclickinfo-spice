package DDG::Spice::Randomcat;

# ABSTRACT: Write an abstract here

# Start at http://docs.duckduckhack.com/walkthroughs/forum-lookup.html if you are new
# to instant answer development

use DDG::Spice;

# Caching - http://docs.duckduckhack.com/backend-reference/api-reference.html#caching
spice is_cached => 0;
spice proxy_cache_valid => "418 1d"; # defaults to this automatically


# Need to escape string passed to &u= param, except $1
my $query_url = uri_esc("http://thecatapi.com/api/images/get?format=xml&results_per_page=1");

spice to => 'https://duckduckgo.com/x.js?u=' . $query_url;
spice wrap_jsonp_callback => 1;


# Triggers - http://docs.duckduckhack.com/walkthroughs/forum-lookup.html#triggers
triggers start => 'random cat pic';

# Handle statement
handle remainder => sub {

    # Query is in $_...if you need to do something with it before returning
    return $_;
};

1;
