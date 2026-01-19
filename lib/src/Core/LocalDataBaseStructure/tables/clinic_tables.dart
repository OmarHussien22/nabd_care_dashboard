import 'package:care_desk/src/Core/LocalDataBaseStructure/localDataSource/interfaces/create_table_data_base.dart';

class ClinicTables {
  static const String clinicsTable = 'clinics';
  static const String doctorsTable = 'doctors';
  static const String patientsTable = 'patients';
  static const String bookingsTable = 'bookings';
}

class CreateClinicTable extends CreateTableDataBase {
  @override
  Map<String, String> createTable() => {
        ClinicTables.clinicsTable: '''
        CREATE TABLE ${ClinicTables.clinicsTable} (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          owner_id INTEGER NOT NULL,
          name TEXT NOT NULL,
          created_at TEXT NOT NULL,
          settings TEXT,
          FOREIGN KEY (owner_id) REFERENCES users(id)
        )
      ''',
      };
}

class CreateDoctorsTable extends CreateTableDataBase {
  @override
  Map<String, String> createTable() => {
        ClinicTables.doctorsTable: '''
        CREATE TABLE ${ClinicTables.doctorsTable} (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          specialization TEXT NOT NULL,
          phone TEXT NOT NULL,
          email TEXT
        )
      ''',
      };
}

class CreatePatientsTable extends CreateTableDataBase {
  @override
  Map<String, String> createTable() => {
        ClinicTables.patientsTable: '''
        CREATE TABLE ${ClinicTables.patientsTable} (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          age INTEGER NOT NULL,
          gender TEXT NOT NULL,
          phone TEXT NOT NULL,
          history TEXT
        )
      ''',
      };
}

class CreateBookingsTable extends CreateTableDataBase {
  @override
  Map<String, String> createTable() => {
        ClinicTables.bookingsTable: '''
        CREATE TABLE ${ClinicTables.bookingsTable} (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          doctor_id INTEGER NOT NULL,
          patient_id INTEGER NOT NULL,
          date_time TEXT NOT NULL,
          status TEXT NOT NULL,
          notes TEXT,
          FOREIGN KEY (doctor_id) REFERENCES ${ClinicTables.doctorsTable}(id),
          FOREIGN KEY (patient_id) REFERENCES ${ClinicTables.patientsTable}(id)
        )
      ''',
      };
}
