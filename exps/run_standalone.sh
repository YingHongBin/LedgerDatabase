rm shard*.config
python gen_config.py 1

../build/bin/timeserver -c ./exps/shard.tss.config -i 0 > log/tss.replica0.log 2>log/tss.replica0.err &
../build/bin/strongstore -m occ -e 0 -s 0 -N 1 -n 0 -t 100 -w ycsb -k 100000 -c ./exps/shard0.config -i 0 > log/shard0.replica0.log 2>log/shard0.replica0.err &
../build/bin/verifyClient -c ./exps/shard -N 1 -d 120 -l 10 -w 50 -g 50 -m occ -e 0 -s 0 -z 0 -t 100 -x 120 -i 0 > log/client.0.log 2>&1 &

cat log/client.0.log | sort -g -k 3 > log/client.log
python exps/process_ycsb/py log/client.log 120 exps/result/50_1_1_0
python exps/aggregate_ycsb.py exps/result exps/result/50_1_1_0