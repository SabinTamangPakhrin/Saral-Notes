class Note {
  String noteId;
  String subject;
  String semester;
  String course;
  String university;
  String author;

  Note({
    this.noteId,
    this.subject,
    this.semester,
    this.course,
    this.university,
    this.author,
  });

  List<Note> getNotes() {
    return [
      Note(
        noteId: '1',
        subject: 'Real-Time System (Old Course)',
        semester: '6',
        course:
            'Bachelors of Science in Computer Science and Information Technology (BSc. CSIT)',
        university: 'Tribuvan University (TU)',
        author: 'Dipendra Chand',
      ),
      Note(
        noteId: '2',
        subject: 'System Analysis and Design',
        semester: '6',
        course:
            'Bachelors of Science in Computer Science and Information Technology (BSc. CSIT)',
        university: 'Tribuvan University (TU)',
        author: 'Dipendra Chand',
      ),
      Note(
        noteId: '3',
        subject: 'Internet Technology',
        semester: '6',
        course:
            'Bachelors of Science in Computer Science and Information Technology (BSc. CSIT)',
        university: 'Tribuvan University (TU)',
        author: 'Dipendra Chand',
      ),
    ];
  }
}
