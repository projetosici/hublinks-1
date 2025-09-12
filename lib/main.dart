import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(ProjectHubApp());

class ProjectHubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Project ICI-RS',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: ProjectHubPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProjectHubPage extends StatelessWidget {
  final List<Project> projects = [
    Project(
      name: 'App de Registro',
      url: 'https://sisop-rs.web.app/',
      icon: Icons.assignment,
    ),
    Project(
      name: 'Documentação App de Registro',
      url: 'https://projetobioinfo-pixel.github.io/documentacaoTriagemOnco/',

      icon: Icons.assignment,
    ),
    Project(
      name: 'Documentação App TriagemOnco',
      url: 'https://projetobioinfo-pixel.github.io/documentacaoTriagemOnco/',

      icon: Icons.assignment,
    ),
    Project(name: 'Documentação Teleoncoped', url: '', icon: Icons.assignment),
    Project(
      name: 'Dash Satisfação ICI',
      url: 'https://dashinterativopy-4kmtzubfe3mgiecgd6xfum.streamlit.app/',

      icon: Icons.insert_chart,
    ),
    Project(
      name: 'Teleoncoped',
      url: 'https://teleoncoped.ici.ong/',
      icon: Icons.medical_services,
    ),
    Project(
      name: 'Dash Oncológico',
      url:
          'https://dashoncologico.streamlit.app/Painel_Oncologico_Pediatrico_(DATASUS)',
      icon: Icons.pie_chart,
    ),
    Project(
      name: 'Produção Web',
      url: 'https://producaoiciweb.web.app/',
      icon: Icons.code,
    ),
    Project(
      name: 'Page Upload ICI',
      url: 'http://pageuploud.web.app',
      icon: Icons.cloud_upload,
    ),
    Project(
      name: 'Page Triagem Oncologia Pediátrica',
      url: 'https://triagemoncopediatrica.web.app/',
      icon: Icons.health_and_safety,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.hub, size: 28),
            SizedBox(width: 8),
            Text('Hub de Projetos | ICI-RS'),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            itemCount: projects.length,
            itemBuilder: (context, index) {
              final project = projects[index];
              return Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.primary.withOpacity(0.1),
                    child: Icon(
                      project.icon,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  title: Text(
                    project.name,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  trailing: Icon(Icons.open_in_new),
                  onTap: () async {
                    final uri = Uri.parse(project.url);
                    if (await canLaunchUrl(uri)) {
                      launchUrl(uri, mode: LaunchMode.externalApplication);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Não foi possível abrir o link.'),
                        ),
                      );
                    }
                  },
                ),
              );
            },
          ),
        ),
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
