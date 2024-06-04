def generate_code(expressions):
    code = []
    for expr in expressions:
        code.append(f"print({expr})")
    return "\n".join(code)

expressions = ["1 + 2", "3 * 4", "5 - 6"]
code = generate_code(expressions)

with open("generated_code.py", "w") as file:
    file.write(code)
