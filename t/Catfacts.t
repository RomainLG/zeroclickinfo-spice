#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use DDG::Test::Spice;

spice is_cached => 1;

ddg_spice_test(
    [qw( DDG::Spice::Catfacts)],
    # At a minimum, be sure to include tests for all:
    # - primary_example_queries
    # - secondary_example_queries
    'random cat fact' => test_spice(
        '/js/spice/catfacts/query',
        call_type => 'include',
        caller => 'DDG::Spice::Catfacts'
    ),
    # Try to include some examples of queries on which it might
    # appear that your answer will trigger, but does not.
    'random fact about cats' => undef,
);

done_testing;

