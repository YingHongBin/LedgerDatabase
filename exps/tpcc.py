f = open("./tpcc.tsv", "w")

for w_id in range(1, 5):
    f.write(f"w_{w_id}\t{w_id},,,,,,,0\n")
    f.write(f"w_tax_{w_id}\t0.05\n")

    for d_id in range(1, 10):
        f.write(f"d_{d_id}_{w_id}\t{d_id},{w_id},,,,,,,0\n")
        f.write(f"d_tx_{d_id}_{w_id}\t0.03\n")

        for c_id in range(1, 3000):
            f.write(f"c_{c_id}_{d_id}_{w_id}\t{c_id},{d_id},{w_id},,,,,,,,,,,,1000000,0,0\n")
            f.write(f"c_discount_{c_id}_{d_id}_{w_id}\t0.05\n")

for i_id in range(1, 100000):
    f.write(f"i_{i_id}\t{i_id},,,10\n")

    for s_w_id in range(1, 5):
        f.write(f"s_{i_id}_{s_w_id}\t{i_id},{s_w_id},1000000,1,2,3,4,5,6,7,8,9,10\n")

f.close()
