#!/bin/sh
#######################################################################
# THIS IS THE TEST SCRIPT FOR THE INDRI QUERY LANGUAGE                #
#######################################################################
# First erase any existing files 
./clean.sh
mkdir index

# Then prepare parameters
cp params/index/*.param .
cp params/retrieve/*.param .

#######################################################################
# The following command builds a position index of the CACM database  #
#  directly from a simple SGML format source                          #
# Note that the version of database.sgml used has been modified to    #
# include <TEXT> tags around the body of each document.               #
# Uses the stopword list provided in smallstop_param.                 #
#######################################################################

./indri-5.14/buildindex/IndriBuildIndex params/index/index_nostem.param
./indri-5.14/buildindex/IndriBuildIndex params/index/index_nostem_stop.param
./indri-5.14/buildindex/IndriBuildIndex params/index/index_stem.param
./indri-5.14/buildindex/IndriBuildIndex params/index/index_stem_stop.param

#######################################################################
# The following shows how to run simple retrieval                     #
# experiments with indri query language queries.                      #
#######################################################################

# No Stemmer / No Stopword Removed
./indri-5.14/runquery/IndriRunQuery params/retrieve/nostem/okapi.param query/query.txt > query_result/nostem/okapi.txt
./indri-5.14/runquery/IndriRunQuery params/retrieve/nostem/LM_jm.param query/query.txt > query_result/nostem/LM_jm.txt
./indri-5.14/runquery/IndriRunQuery params/retrieve/nostem/LM_la.param query/query.txt > query_result/nostem/LM_la.txt
./indri-5.14/runquery/IndriRunQuery params/retrieve/nostem/LM_fb.param query/query.txt > query_result/nostem/LM_fb.txt


# No Stemmer / With Stopword Removed
./indri-5.14/runquery/IndriRunQuery params/retrieve/nostem_stop/okapi.param query/query.txt > query_result/nostem_stop/okapi.txt
./indri-5.14/runquery/IndriRunQuery params/retrieve/nostem_stop/LM_jm.param query/query.txt > query_result/nostem_stop/LM_jm.txt
./indri-5.14/runquery/IndriRunQuery params/retrieve/nostem_stop/LM_la.param query/query.txt > query_result/nostem_stop/LM_la.txt
./indri-5.14/runquery/IndriRunQuery params/retrieve/nostem_stop/LM_fb.param query/query.txt > query_result/nostem_stop/LM_fb.txt


# With Stemmer / No Stopword Removed
./indri-5.14/runquery/IndriRunQuery params/retrieve/stem/okapi.param query/query.txt > query_result/stem/okapi.txt
./indri-5.14/runquery/IndriRunQuery params/retrieve/stem/LM_jm.param query/query.txt > query_result/stem/LM_jm.txt
./indri-5.14/runquery/IndriRunQuery params/retrieve/stem/LM_la.param query/query.txt > query_result/stem/LM_la.txt
./indri-5.14/runquery/IndriRunQuery params/retrieve/stem/LM_fb.param query/query.txt > query_result/stem/LM_fb.txt


# With Stemmer / With Stopword Removed
./indri-5.14/runquery/IndriRunQuery params/retrieve/stem_stop/okapi.param query/query.txt > query_result/stem_stop/okapi.txt
./indri-5.14/runquery/IndriRunQuery params/retrieve/stem_stop/LM_jm.param query/query.txt > query_result/stem_stop/LM_jm.txt
./indri-5.14/runquery/IndriRunQuery params/retrieve/stem_stop/LM_la.param query/query.txt > query_result/stem_stop/LM_la.txt
./indri-5.14/runquery/IndriRunQuery params/retrieve/stem_stop/LM_fb.param query/query.txt > query_result/stem_stop/LM_fb.txt

### Evaluation each ranging function
./eval.sh
