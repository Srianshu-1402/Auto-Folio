-- 1. USER table (Google‑authenticated users)
CREATE TABLE IF NOT EXISTS user_account (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  google_id VARCHAR(100) NOT NULL UNIQUE,
  email VARCHAR(150) NOT NULL UNIQUE,
  name VARCHAR(100),
  profile_image_url VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

-- 2. PORTFOLIO table (one per user)
CREATE TABLE IF NOT EXISTS portfolio (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  user_id BIGINT NOT NULL,
  slug VARCHAR(150) NOT NULL UNIQUE,
  headline VARCHAR(255),
  summary TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES user_account(id) ON DELETE CASCADE);

-- 3. SKILL table
CREATE TABLE IF NOT EXISTS skill (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  portfolio_id BIGINT NOT NULL,
  name VARCHAR(100) NOT NULL,
  proficiency VARCHAR(50),
  FOREIGN KEY (portfolio_id) REFERENCES portfolio(id) ON DELETE CASCADE);

-- 4. PROJECT table
CREATE TABLE IF NOT EXISTS project (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  portfolio_id BIGINT NOT NULL,
  title VARCHAR(150) NOT NULL,
  description TEXT,
  project_url VARCHAR(255),
  repo_url VARCHAR(255),
  start_date DATE,
  end_date DATE,
  FOREIGN KEY (portfolio_id) REFERENCES portfolio(id) ON DELETE CASCADE);

-- 5. SOCIAL_LINK table
CREATE TABLE IF NOT EXISTS social_link (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  portfolio_id BIGINT NOT NULL,
  platform VARCHAR(50) NOT NULL,
  url VARCHAR(255) NOT NULL,
  FOREIGN KEY (portfolio_id) REFERENCES portfolio(id) ON DELETE CASCADE);

-- 6. EXPERIENCE table
CREATE TABLE IF NOT EXISTS experience (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  portfolio_id BIGINT NOT NULL,
  company VARCHAR(150),
  role VARCHAR(100),
  start_date DATE,
  end_date DATE,
  description TEXT,
  FOREIGN KEY (portfolio_id) REFERENCES portfolio(id) ON DELETE CASCADE);

-- 7. EDUCATION table
CREATE TABLE IF NOT EXISTS education (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  portfolio_id BIGINT NOT NULL,
  institution VARCHAR(150),
  degree VARCHAR(100),
  field_of_study VARCHAR(100),
  start_year YEAR,
  end_year YEAR,
  FOREIGN KEY (portfolio_id) REFERENCES portfolio(id) ON DELETE CASCADE);