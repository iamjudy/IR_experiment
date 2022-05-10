import matplotlib.pyplot as plt
import argparse
import numpy as np
from eval_results import EvaluationResult

import matplotlib
matplotlib.use('Agg')

import pandas as pd 

def pr_curve(files, outfile):
    result_list = [EvaluationResult(f) for f in files]

    names = [r.runid for r in result_list]
    iprec = [[r.results['iprec_at_recall_0.00'],
              r.results['iprec_at_recall_0.10'],
              r.results['iprec_at_recall_0.20'],
              r.results['iprec_at_recall_0.30'],
              r.results['iprec_at_recall_0.40'],
              r.results['iprec_at_recall_0.50'],
              r.results['iprec_at_recall_0.60'],
              r.results['iprec_at_recall_0.70'],
              r.results['iprec_at_recall_0.80'],
              r.results['iprec_at_recall_0.90'],
              r.results['iprec_at_recall_1.00']] for r in result_list]

    recall = np.arange(0, 1.1, 0.1)

    plt.xlabel('Recall')
    plt.ylabel('Interpolated Precision')


    for p in iprec:
        plt.plot(recall, p)

    plt.legend(names)
    plt.savefig(outfile, bbox_inches='tight')


def precision_at_k(files):
    result_list = [EvaluationResult(f) for f in files]

    names = [r.runid for r in result_list]
    kprec = [[r.results['P_5'],
            r.results['P_10'],
            r.results['P_15'],
            r.results['P_20'],
            r.results['P_30'],
            r.results['P_100'],
            r.results['P_200'],
            r.results['P_500'],
            r.results['P_1000']] for r in result_list]

    x = [5,10,15,20,30,100,200,500,1000]

    plt.xlabel('at k Docs')
    plt.ylabel('Precision')

    for p in kprec:
        plt.plot(x, p)

    plt.legend(names)
    plt.savefig('pk_nostem_rankingfunction.png', bbox_inches='tight')
    

def summary(files):
    result_list = [EvaluationResult(f) for f in files]

    names = [r.runid for r in result_list]
    map = [r.results['map'] for r in result_list]
    p_10 = [r.results['P_10'] for r in result_list]
    rel_ret = [r.results['num_rel_ret'] for r in result_list]
    retrieved = [r.results['num_ret'] for r in result_list]
    relevant = [r.results['num_rel'] for r in result_list]


    f = []
    for i in range(len(rel_ret)):
        precision = round(rel_ret[i]/retrieved[i], 4)
        recall = round(rel_ret[i]/relevant[i], 4)

        f1 = float(round(2/(1/precision+1/recall), 4))
        f.append(f1)

    # print out the results you want (names/map/p_10/rel_ret/retrieved/relevant/f)
    print(names)
    print(map)
    print(p_10)
    print(f)



if __name__ == '__main__':
    argparser = argparse.ArgumentParser('Plot precision-recall curves.')
    argparser.add_argument('-f', '--output', help='Save the figure to specified file.',
                           default='pr_curve.png', required=False)
    argparser.add_argument('files',
                           help='Pass multiple files to plot all the runs in the same plot.',
                           type=str, nargs='+')
    args = argparser.parse_args()

    # pr_curve(args.files, args.output)
    precision_at_k(args.files)
    # summary(args.files)
