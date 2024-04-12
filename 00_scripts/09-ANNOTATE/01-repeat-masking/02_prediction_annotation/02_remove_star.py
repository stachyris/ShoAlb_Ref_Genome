def remove_stars(input_file, output_file):
    with open(input_file, 'r') as f:
        data = f.read()

    data = data.replace('*', '')

    with open(output_file, 'w') as f:
        f.write(data)

remove_stars("braker.aa", "braker-star-removed.aa")

