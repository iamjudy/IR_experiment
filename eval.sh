#######################################################################
# Evaluation
#######################################################################

## No Stopword Removed
# 1. No Stemmer
echo "----------------------------------------------------------------"
echo "No Stemmer and No Stopword Removed"
perl eval/trec_eval eval/qrels.401-450.txt result/nostem/okapi.txt
eval/trec_eval-9.0.7/trec_eval eval/qrels.401-450.txt query_result/nostem/okapi.txt > eval_results/nostem/nostem_okapi.txt
eval/trec_eval-9.0.7/trec_eval eval/qrels.401-450.txt query_result/nostem/LM_jm.txt > eval_results/nostem/nostem_LM_jm.txt
eval/trec_eval-9.0.7/trec_eval eval/qrels.401-450.txt query_result/nostem/LM_la.txt > eval_results/nostem/nostem_LM_la.txt
eval/trec_eval-9.0.7/trec_eval eval/qrels.401-450.txt query_result/nostem/LM_fb.txt > eval_results/nostem/nostem_LM_fb.txt


# 2. With Stemmer
echo;
echo "With Stemmer and No Stopword Removed"
eval/trec_eval-9.0.7/trec_eval eval/qrels.401-450.txt query_result/stem/okapi.txt > eval_results/stem/stem_okapi.txt
eval/trec_eval-9.0.7/trec_eval eval/qrels.401-450.txt query_result/stem/LM_jm.txt > eval_results/stem/stem_LM_jm.txt
eval/trec_eval-9.0.7/trec_eval eval/qrels.401-450.txt query_result/stem/LM_la.txt > eval_results/stem/stem_LM_la.txt
eval/trec_eval-9.0.7/trec_eval eval/qrels.401-450.txt query_result/stem/LM_fb.txt > eval_results/stem/stem_LM_fb.txt


## Bouns: Stopword Removed
echo;
echo "No Stemmer and Stopword Removed"
eval/trec_eval-9.0.7/trec_eval eval/qrels.401-450.txt query_result/nostem_stop/okapi.txt > eval_results/nostem/nostem_stop_okapi.txt
eval/trec_eval-9.0.7/trec_eval eval/qrels.401-450.txt query_result/nostem_stop/LM_jm.txt > eval_results/nostem/nostem_stop_LM_jm.txt
eval/trec_eval-9.0.7/trec_eval eval/qrels.401-450.txt query_result/nostem_stop/LM_la.txt > eval_results/nostem/nostem_stop_LM_la.txt
eval/trec_eval-9.0.7/trec_eval eval/qrels.401-450.txt query_result/nostem_stop/LM_fb.txt > eval_results/nostem/nostem_stop_LM_fb.txt


echo;
echo "With Stemmer and Stopword Removed"
eval/trec_eval-9.0.7/trec_eval eval/qrels.401-450.txt query_result/stem_stop/okapi.txt > eval_results/stem/stem_stop_okapi.txt
eval/trec_eval-9.0.7/trec_eval eval/qrels.401-450.txt query_result/stem_stop/LM_jm.txt > eval_results/stem/stem_stop_LM_jm.txt
eval/trec_eval-9.0.7/trec_eval eval/qrels.401-450.txt query_result/stem_stop/LM_la.txt > eval_results/stem/stem_stop_LM_la.txt
eval/trec_eval-9.0.7/trec_eval eval/qrels.401-450.txt query_result/stem_stop/LM_fb.txt > eval_results/stem/stem_stop_LM_fb.txt
