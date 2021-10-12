from flask import request, render_template, make_response
from flask import current_app as app

from .utils import gen_rect
from .utils import gen_obj

import os

JSON_MIME_TYPE = 'application/json'

@app.route('/')
def index():
    return render_template('index.html', title='PIFuHD example')

@app.route('/upload', methods=['POST'])
def upload_image():
    try:
        image = request.files['file']
        image_path = f"{app.config['UPLOAD_FOLDER']}/{image.filename}"
        image.save(image_path)

        gen_rect(image_path)
        obj_path = gen_obj(os.path.splitext(os.path.basename(image_path))[0])

        return { 'path': obj_path }, 200
    except Exception as e:
        raise e
        #return { 'message': f'Something went wrong {e}' }, 500
