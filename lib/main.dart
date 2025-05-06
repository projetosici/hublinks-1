import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(ProjectHubApp());

class ProjectHubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Project ICI-RS',
      home: ProjectHubPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProjectHubPage extends StatelessWidget {
  final List<Project> projects = [
    Project(name: 'App de Registro', url: 'https://sisop-rs.web.app/', icon: Icons.assignment),
    Project(name: 'Documentação App de Registro', url: 'https://alexvovo.github.io/Documentacao-App-Registro/', icon: Icons.assignment),
    Project(name: 'Dash Satisfação ICI', url: 'https://dashsastifacaoici.streamlit.app/', icon: Icons.insert_chart),
    Project(name: 'Teleoncoped', url: 'https://teleoncoped.ici.ong/', icon: Icons.medical_services),
    Project(name: 'Dash Oncológico', url: 'https://dashoncologico.streamlit.app/Painel_Oncologico_Pediatrico_(DATASUS)', icon: Icons.pie_chart),
    Project(name: 'Produção Web', url: 'https://producaoiciweb.web.app/', icon: Icons.code),
    Project(name: 'Page Upload ICI', url: 'http://pageuploud.web.app', icon: Icons.cloud_upload),
    Project(name: 'Page Triagem Oncologia Pediatrica', url: 'https://triagemoncopediatrica.web.app/', icon: Icons.health_and_safety),
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hub de Projetos | ICI-RS'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Icon(project.icon, color: Theme.of(context).primaryColor),
              title: Text(project.name),
              trailing: Icon(Icons.open_in_new),
              onTap: () => launchUrl(Uri.parse(project.url)),
            ),
          );
        },
      ),
    );
  }
}

class Project {
  final String name;
  final String url;
  final IconData icon;

  Project({required this.name, required this.url, required this.icon});
}
