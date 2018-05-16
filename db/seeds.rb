User.create(username: "brittany", password: "password")
User.create(username: "justin", password: "password")
User.create(username: "carly", password: "password")

britt = User.find_by(username: "brittany")
carly = User.find_by(username: "carly")

britt.recipes.build(name: "quinoa", url: "quinoa.com")
britt.recipes.build(name: "cereal", url: "breakfast.com")
carly.recipes.build(name: "mac and cheese", url: "mac.com")
carly.recipes.build(name: "sweet potato", url: "yum.org")

britt.save
carly.save

mac = Recipe.find_by(name: "mac and cheese")
quinoa = Recipe.find_by(name: "quinoa")

britt.add_bookmark(mac)
carly.add_bookmark(quinoa)

britt.save
carly.save
