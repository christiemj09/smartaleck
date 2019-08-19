"""
Install attributes.
"""

def main():
	try:
		from setuptools import setup
	except ImportError:
		from distutils.core import setup

	config = {
		'description': 'Defines some attributes for smartaleck experiments',
		'author': 'Matt Christie',
		'download_url': '',
		'author_email': 'christiemj09@gmail.com',
		'version': '0.1',
		'install_requires': [],
		'py_modules': ['attributes'],
		'scripts': [],
		'entry_points': {
		    'console_scripts': [],
		},
		'name': 'attributes'
	}

	setup(**config)	

if __name__ == '__main__':
	main()

