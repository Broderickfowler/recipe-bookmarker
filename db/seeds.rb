User.create(username: "brittany", password: "password")
User.create(username: "justin", password: "password")
User.create(username: "carly", password: "password")

britt = User.find_by(username: "brittany")

britt.created_recipes.build(name: "Spaghetti", url: "spaghetti.com")
britt.created_recipes.build(name: "Quinoa", url: "quinoa.com")

carly = User.find_by(username: "carly")

carly.created_recipes.build(name: "tacos", url: "tacos.com")
