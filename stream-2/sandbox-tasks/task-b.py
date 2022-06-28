"""
Василий забыл ПИН-код от своей банковской карты. Точно помнит только первую цифру. Остальные три цифры он тоже
вспомнил, но забыл в какой последовательности они должны идти. Василий уверен, что эти три цифры точно разные и среди
них нет нуля. Помогите ему подобрать ПИН-код – выведите на экран все возможные комбинации трёхзначных чисел,
собранные из цифр исходного натурального числа n, в порядке возрастания.
"""


import itertools


def pincode_variations(n: str) -> None:
    if n.isnumeric() and '0' not in str(n) and len(set(str(n))) == len(str(n)) and 123 <= int(n) <= 987:
        result = list(map("".join, itertools.permutations(str(n))))
        result.sort()
        for _ in result:
            print(_)
    else:
        print(n)


if __name__ == "__main__":
    input_str = input()
    pincode_variations(input_str)
