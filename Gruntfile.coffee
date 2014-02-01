module.exports = (grunt)->

	grunt.initConfig
		pkg: grunt.file.readJSON('package.json')
		
		simplemocha:
			server:
				compilers: 'coffee:coffee-script'
				src: 'test/server/**/*.coffee'

	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-simple-mocha'

	grunt.registerTask 'default',['simplemocha:server']

