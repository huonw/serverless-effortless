from matplotlib import pyplot as plt
import io

def handler(event, context):
    # hard-coded data, but would be read from a database or other
    # service
    builder = ["Native macOS", "ARM Docker", "x86-64 Docker"]
    times = [7.4, 57, 102]

    fig, ax = plt.subplots()
    ax.bar(builder, times)
    ax.set_ylabel("Build time (s)")

    out = io.BytesIO()
    fig.savefig(out, format="png")

    return out.getvalue()
