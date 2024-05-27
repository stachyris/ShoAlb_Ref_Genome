def rename_header(input_file, output_file):
    with open(input_file, 'r') as f:
        lines = f.readlines()

    with open(output_file, 'w') as f:
        for line in lines:
            if line.startswith('>'):
                f.write(">Mitochondria\n")
            else:
                f.write(line)
rename_header('final_mitogenome.fasta', 'ShoAlb_mitogenome.fasta')

