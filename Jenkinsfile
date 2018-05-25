node {
	def app

	stage('Clone repository') {
		checkout scm
	}

	stage('Build image') {
		sh 'scripts/clean.sh'
		sh 'scripts/build.sh'
	}

	stage('Run image') {
		sh 'scripts/run.sh'
	}
}