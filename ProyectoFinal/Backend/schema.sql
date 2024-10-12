CREATE TABLE Projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    start_date DATE,
    end_date DATE
);

CREATE TABLE test_plans (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  start_date DATE,
  end_date DATE,
  status ENUM('active', 'inactive') DEFAULT 'active',
  project_id INT,
  status VARCHAR(20),
  FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE
);


CREATE TABLE TestCases (
    id INT AUTO_INCREMENT PRIMARY KEY,
    test_plan_id INT,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    status ENUM('pending', 'passed', 'failed') DEFAULT 'pending',
    FOREIGN KEY (test_plan_id) REFERENCES TestPlans(id) ON DELETE CASCADE
);

CREATE TABLE Defects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    test_case_id INT,
    description TEXT NOT NULL,
    status ENUM('open', 'in progress', 'resolved', 'closed') DEFAULT 'open',
    assigned_to VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (test_case_id) REFERENCES TestCases(id) ON DELETE CASCADE
);


CREATE TABLE Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);


CREATE TABLE TestExecutions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    test_case_id INT NOT NULL,
    execution_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    result ENUM('passed', 'failed', 'pending') DEFAULT 'pending',
    evidence TEXT,
    comments TEXT,
    FOREIGN KEY (test_case_id) REFERENCES TestCases(id) ON DELETE CASCADE
);
