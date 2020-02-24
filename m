Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id DBE5416B278
	for <lists+linux-audit@lfdr.de>; Mon, 24 Feb 2020 22:32:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582579939;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7li2PnfFHHbwr5/AFHa+/CCF/hiP+raPXW4FuZV6J2c=;
	b=DKwHy9s6CsCYBo65a8rr/TxrjnVtrGs172ZmF2FoFijDtb4oj7n5/OJ+YRBCE/lZ44HF2b
	5YU3rGAfeasBN4eNq/lOa3FlaZl4+ST01LZk9oKnHUs755Gu92QIumtKP7xQQOBG8MAwuK
	qsdxktXsNu5IEqp7A6/+kg4d6VCh3gw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-zr3NVb31Nci6YNbyE4l0lA-1; Mon, 24 Feb 2020 16:32:17 -0500
X-MC-Unique: zr3NVb31Nci6YNbyE4l0lA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44C97801F99;
	Mon, 24 Feb 2020 21:32:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF8448B774;
	Mon, 24 Feb 2020 21:32:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 81EA5860C9;
	Mon, 24 Feb 2020 21:31:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01OLVkAg018809 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 24 Feb 2020 16:31:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 583F6EB357; Mon, 24 Feb 2020 21:31:46 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53D829C639
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 21:31:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A764101A55E
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 21:31:44 +0000 (UTC)
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
	[209.85.219.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-392-GYKoCupFPdGcclrqLRq0mg-1; Mon, 24 Feb 2020 16:31:41 -0500
X-MC-Unique: GYKoCupFPdGcclrqLRq0mg-1
Received: by mail-qv1-f67.google.com with SMTP id g6so4793060qvy.5
	for <linux-audit@redhat.com>; Mon, 24 Feb 2020 13:31:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:date:message-id:user-agent
	:mime-version:content-transfer-encoding;
	bh=WIO8Z7jhBF6qD786k+7arkxjKv7KC13DSXV+DHlrIMI=;
	b=QxPFnGWj2qQDwfmOqF5MjZmvyXYE5rC2CCoLhXu4u5LIQRbG1MhIDS7pdUkQcJAxBS
	QLkxV7cm+R/4c9JYaoArgv9jrE5FZbZVwIjJ+9UIjCmZauh7p3GYZJTk8WVt5D9OUzdO
	NhTiGszfhpWLa8DQhXtAEDODAgHDNLIPYW1sRZ+oD9ydSEXcTnl2hK3SvZjPKzHvxmck
	faOPhlYFfhUCy/Z3skyvmbRjgxht/gZQ8orO0jZ2rOEKNeykW0lBu5ms15mOOOwj33m9
	Dd0WLvlBaqfRZSC+zSEoVlmSdOpro0i2kY6TrEZHG4wjCesIlCLSJJNMuafLl2QiUApL
	gEsg==
X-Gm-Message-State: APjAAAXbv+4TvojimQlJtXKlpJJC5ST9GkeyaYjqAcZNxmymrShSyKeE
	srOBrpHQhOc+7xiTn0EYupFlY0pMtA==
X-Google-Smtp-Source: APXvYqweQGl/uB/kkKwkzl7zI/KDMwbFjD32F3hSG1h6DDuaIw4eusvfUPHEcFBmYJAXmbtpHKUUcQ==
X-Received: by 2002:a0c:d611:: with SMTP id c17mr23027685qvj.249.1582579899825;
	Mon, 24 Feb 2020 13:31:39 -0800 (PST)
Received: from localhost (pool-71-245-238-133.bstnma.fios.verizon.net.
	[71.245.238.133])
	by smtp.gmail.com with ESMTPSA id n74sm249747qke.63.2020.02.24.13.31.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 24 Feb 2020 13:31:38 -0800 (PST)
Subject: [PATCH] audit: fix error handling in audit_data_to_entry()
From: Paul Moore <paul@paul-moore.com>
To: linux-audit@redhat.com
Date: Mon, 24 Feb 2020 16:31:38 -0500
Message-ID: <158257989798.399121.1279697192021117003.stgit@chester>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Commit 219ca39427bf ("audit: use union for audit_field values since
they are mutually exclusive") combined a number of separate fields in
the audit_field struct into a single union.  Generally this worked
just fine because they are generally mutually exclusive.
Unfortunately in audit_data_to_entry() the overlap can be a problem
when a specific error case is triggered that causes the error path
code to attempt to cleanup an audit_field struct and the cleanup
involves attempting to free a stored LSM string (the lsm_str field).
Currently the code always has a non-NULL value in the
audit_field.lsm_str field as the top of the for-loop transfers a
value into audit_field.val (both .lsm_str and .val are part of the
same union); if audit_data_to_entry() fails and the audit_field
struct is specified to contain a LSM string, but the
audit_field.lsm_str has not yet been properly set, the error handling
code will attempt to free the bogus audit_field.lsm_str value that
was set with audit_field.val at the top of the for-loop.

This patch corrects this by ensuring that the audit_field.val is only
set when needed (it is cleared when the audit_field struct is
allocated with kcalloc()).  It also corrects a few other issues to
ensure that in case of error the proper error code is returned.

Cc: stable@vger.kernel.org
Fixes: 219ca39427bf ("audit: use union for audit_field values since they are mutually exclusive")
Reported-by: syzbot+1f4d90ead370d72e450b@syzkaller.appspotmail.com
Signed-off-by: Paul Moore <paul@paul-moore.com>
---
 kernel/auditfilter.c |   71 +++++++++++++++++++++++++++-----------------------
 1 file changed, 39 insertions(+), 32 deletions(-)

diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
index b0126e9c0743..026e34da4ace 100644
--- a/kernel/auditfilter.c
+++ b/kernel/auditfilter.c
@@ -456,6 +456,7 @@ static struct audit_entry *audit_data_to_entry(struct audit_rule_data *data,
 	bufp = data->buf;
 	for (i = 0; i < data->field_count; i++) {
 		struct audit_field *f = &entry->rule.fields[i];
+		u32 f_val;
 
 		err = -EINVAL;
 
@@ -464,12 +465,12 @@ static struct audit_entry *audit_data_to_entry(struct audit_rule_data *data,
 			goto exit_free;
 
 		f->type = data->fields[i];
-		f->val = data->values[i];
+		f_val = data->values[i];
 
 		/* Support legacy tests for a valid loginuid */
-		if ((f->type == AUDIT_LOGINUID) && (f->val == AUDIT_UID_UNSET)) {
+		if ((f->type == AUDIT_LOGINUID) && (f_val == AUDIT_UID_UNSET)) {
 			f->type = AUDIT_LOGINUID_SET;
-			f->val = 0;
+			f_val = 0;
 			entry->rule.pflags |= AUDIT_LOGINUID_LEGACY;
 		}
 
@@ -485,7 +486,7 @@ static struct audit_entry *audit_data_to_entry(struct audit_rule_data *data,
 		case AUDIT_SUID:
 		case AUDIT_FSUID:
 		case AUDIT_OBJ_UID:
-			f->uid = make_kuid(current_user_ns(), f->val);
+			f->uid = make_kuid(current_user_ns(), f_val);
 			if (!uid_valid(f->uid))
 				goto exit_free;
 			break;
@@ -494,11 +495,12 @@ static struct audit_entry *audit_data_to_entry(struct audit_rule_data *data,
 		case AUDIT_SGID:
 		case AUDIT_FSGID:
 		case AUDIT_OBJ_GID:
-			f->gid = make_kgid(current_user_ns(), f->val);
+			f->gid = make_kgid(current_user_ns(), f_val);
 			if (!gid_valid(f->gid))
 				goto exit_free;
 			break;
 		case AUDIT_ARCH:
+			f->val = f_val;
 			entry->rule.arch_f = f;
 			break;
 		case AUDIT_SUBJ_USER:
@@ -511,11 +513,13 @@ static struct audit_entry *audit_data_to_entry(struct audit_rule_data *data,
 		case AUDIT_OBJ_TYPE:
 		case AUDIT_OBJ_LEV_LOW:
 		case AUDIT_OBJ_LEV_HIGH:
-			str = audit_unpack_string(&bufp, &remain, f->val);
-			if (IS_ERR(str))
+			str = audit_unpack_string(&bufp, &remain, f_val);
+			if (IS_ERR(str)) {
+				err = PTR_ERR(str);
 				goto exit_free;
-			entry->rule.buflen += f->val;
-
+			}
+			entry->rule.buflen += f_val;
+			f->lsm_str = str;
 			err = security_audit_rule_init(f->type, f->op, str,
 						       (void **)&f->lsm_rule);
 			/* Keep currently invalid fields around in case they
@@ -524,68 +528,71 @@ static struct audit_entry *audit_data_to_entry(struct audit_rule_data *data,
 				pr_warn("audit rule for LSM \'%s\' is invalid\n",
 					str);
 				err = 0;
-			}
-			if (err) {
-				kfree(str);
+			} else if (err)
 				goto exit_free;
-			} else
-				f->lsm_str = str;
 			break;
 		case AUDIT_WATCH:
-			str = audit_unpack_string(&bufp, &remain, f->val);
-			if (IS_ERR(str))
+			str = audit_unpack_string(&bufp, &remain, f_val);
+			if (IS_ERR(str)) {
+				err = PTR_ERR(str);
 				goto exit_free;
-			entry->rule.buflen += f->val;
-
-			err = audit_to_watch(&entry->rule, str, f->val, f->op);
+			}
+			err = audit_to_watch(&entry->rule, str, f_val, f->op);
 			if (err) {
 				kfree(str);
 				goto exit_free;
 			}
+			entry->rule.buflen += f_val;
 			break;
 		case AUDIT_DIR:
-			str = audit_unpack_string(&bufp, &remain, f->val);
-			if (IS_ERR(str))
+			str = audit_unpack_string(&bufp, &remain, f_val);
+			if (IS_ERR(str)) {
+				err = PTR_ERR(str);
 				goto exit_free;
-			entry->rule.buflen += f->val;
-
+			}
 			err = audit_make_tree(&entry->rule, str, f->op);
 			kfree(str);
 			if (err)
 				goto exit_free;
+			entry->rule.buflen += f_val;
 			break;
 		case AUDIT_INODE:
+			f->val = f_val;
 			err = audit_to_inode(&entry->rule, f);
 			if (err)
 				goto exit_free;
 			break;
 		case AUDIT_FILTERKEY:
-			if (entry->rule.filterkey || f->val > AUDIT_MAX_KEY_LEN)
+			if (entry->rule.filterkey || f_val > AUDIT_MAX_KEY_LEN)
 				goto exit_free;
-			str = audit_unpack_string(&bufp, &remain, f->val);
-			if (IS_ERR(str))
+			str = audit_unpack_string(&bufp, &remain, f_val);
+			if (IS_ERR(str)) {
+				err = PTR_ERR(str);
 				goto exit_free;
-			entry->rule.buflen += f->val;
+			}
+			entry->rule.buflen += f_val;
 			entry->rule.filterkey = str;
 			break;
 		case AUDIT_EXE:
-			if (entry->rule.exe || f->val > PATH_MAX)
+			if (entry->rule.exe || f_val > PATH_MAX)
 				goto exit_free;
-			str = audit_unpack_string(&bufp, &remain, f->val);
+			str = audit_unpack_string(&bufp, &remain, f_val);
 			if (IS_ERR(str)) {
 				err = PTR_ERR(str);
 				goto exit_free;
 			}
-			entry->rule.buflen += f->val;
-
-			audit_mark = audit_alloc_mark(&entry->rule, str, f->val);
+			audit_mark = audit_alloc_mark(&entry->rule, str, f_val);
 			if (IS_ERR(audit_mark)) {
 				kfree(str);
 				err = PTR_ERR(audit_mark);
 				goto exit_free;
 			}
+			entry->rule.buflen += f_val;
 			entry->rule.exe = audit_mark;
 			break;
+		default:
+			f->val = f_val;
+			break;
 		}
 	}
 

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

