from flask import Flask, redirect, render_template, url_for, request

app = Flask(__name__)

foods = {
    "CUISINES": ["indian", "chinese", "italian"],
    "BAKERY": ["cakes", "breads", "confectionary"],
    "STARTERS": ["soups", "fries", "manchurian", "rolls"],
    "MAIN COURSE": ["rice", "rotis", "thali", "noodles", "porridge"],
    "DESERTS": ["sweets", "icecream", "savouries"],
    "SNACKS": ["chips", "tortillas", "tradionals"],
    "DRINKS": ["milkshake", "mocktail", "fruit juices"],
    "TIFFINS": ["idly", "dosa", "chapathi"]

}

pic_names = ['breads.jpg', 'cakes.jpg', 'chapathi.jpg', 'chinese.jpg', 'chips.jpg', 'confectionary.jpg', 'dosa.jpg',
             'fries.jpg', 'fruit juices.jpg', 'icecream.jpg', 'idly.jpg', 'indian.jpg', 'italian.jpg', 'manchurian.jpg',
             'milkshake.jpg', 'mocktail.jpg', 'noodles.jpg', 'porridge.jpg', 'rice.jpg', 'rolls.jpg', 'rotis.jpg',
             'savouries.jpg', 'soups.jpg', 'sweets.jpg', 'thali.jpg', 'tortillas.jpg', 'traditionals.jpg', 'upma.jpg']

imgs = {}
for x in pic_names:
    imgs[x[::-1][4:][::-1]] = "/static/styles/foods/" + x

print(imgs)


@app.route("/", methods=["GET"])
def index():
    return render_template("login.html")


@app.route("/expert", methods=['GET', 'POST'])
def expert():
    return render_template("experttadvice.html")


@app.route("/<string:name>", methods=["GET"])
def hello(name):
    if name == "registration.html":
        return render_template("registration.html")
    if name == "login.html":
        return render_template("login.html")
    if name == "about.html":
        return render_template("about.html")
    return render_template("m1.html", data={"name": name, "lists": foods})


@app.route("/food/<string:item>")
def food(item):
    return render_template("foodpage.html", data={"name": item, "imgs": imgs})


@app.route("/house", methods=["POST"])
def login():
    return redirect("/" + request.form.get("first name"))


app.run()
