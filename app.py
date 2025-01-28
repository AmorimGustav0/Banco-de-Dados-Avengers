from flask import Flask, render_template
# from model.interface import Interface


app = Flask (__name__)

@app.route("/")
def mainPage():
    return render_template("home.html")
    



# def main():
    
#     Interface()
    
        
# if __name__ == '__main__':
#     main()
