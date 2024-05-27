def rename_headers(input_file, output_file):
    with open(input_file, 'r') as f:
        lines = f.readlines()

    with open(output_file, 'w') as f:
        i = 1
        for line in lines:
            if line.startswith('>'):
                f.write(f'>scaffold{i}\n')
                i += 1
            else:
                f.write(line)

rename_headers('bShoAlb1.1.fasta.masked', 'bShoAlb1.1.fasta')

