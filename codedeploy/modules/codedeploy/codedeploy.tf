resource "aws_codedeploy_app" "app" {
  name = "${var.stack_name}-${var.environment}"
}

resource "aws_codedeploy_deployment_config" "create_config" {
  deployment_config_name = "create_config"

  minimum_healthy_hosts {
    type  = "HOST_COUNT"
    value = 0
  }
}

resource "aws_codedeploy_deployment_group" "create_group" {
  app_name               = "${aws_codedeploy_app.app.name}"
  deployment_group_name  = "create"
  service_role_arn       = "${aws_iam_role.codedeploy_role.arn}"
  deployment_config_name = "${aws_codedeploy_deployment_config.create_config.id}"
  autoscaling_groups     = ["${var.asg_id}"]

  auto_rollback_configuration {
    enabled = false
  }
}

resource "aws_codedeploy_deployment_config" "update_config" {
  deployment_config_name = "update"

  minimum_healthy_hosts {
    type  = "HOST_COUNT"
    value = 2
  }
}

resource "aws_codedeploy_deployment_group" "update_group" {
  app_name               = "${aws_codedeploy_app.app.name}"
  deployment_group_name  = "update"
  service_role_arn       = "${aws_iam_role.codedeploy_role.arn}"
  deployment_config_name = "${aws_codedeploy_deployment_config.update_config.id}"
  autoscaling_groups     = ["${var.asg_id}"]

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }

  alarm_configuration {
    alarms  = ["update-alarm"]
    enabled = true
  }
}
