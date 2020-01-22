Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 57288145E08
	for <lists+linux-audit@lfdr.de>; Wed, 22 Jan 2020 22:30:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579728607;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YPZOjT+YC01gzSOxKtZ/zwLJF9JRjb1As/oHJfpNcZ4=;
	b=N7Yjk6oXF280reWNHIAJX82iu4UEaqnoaCEq4R/ZLjn0TEk1WXfYpso9ZTLkpKsikTxs/y
	xioPk8Q+8Osk43X6Zg+5BWSkknejUWK3Fr9V+XceDexhFAwWYfNXqs6WTO0ffbZ1MPtQ1J
	oUWcBCbC1dHg4u4MhmcpsgMvj8dn8m4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-cxfd848YNv68KBKUVl71tg-1; Wed, 22 Jan 2020 16:30:05 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C9EA107ACC5;
	Wed, 22 Jan 2020 21:30:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 238441001B28;
	Wed, 22 Jan 2020 21:30:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D1BBA870B4;
	Wed, 22 Jan 2020 21:29:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00MLTt9N003723 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 22 Jan 2020 16:29:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A2E422166B2A; Wed, 22 Jan 2020 21:29:55 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EA952166B27
	for <linux-audit@redhat.com>; Wed, 22 Jan 2020 21:29:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8045085A336
	for <linux-audit@redhat.com>; Wed, 22 Jan 2020 21:29:55 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-400-oUI3SiL_NTeunoMi66qDxg-1; Wed, 22 Jan 2020 16:29:53 -0500
Received: by mail-lf1-f65.google.com with SMTP id y1so724782lfb.6
	for <linux-audit@redhat.com>; Wed, 22 Jan 2020 13:29:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QtzDsuL2wxUZ5ywGO+m8auB4mvm7TddMdWO8k2uItsM=;
	b=ZrCx6nzZJicGyw3z8Tjnv8jnHR2nPKjTSeqjqGSSTDRGQdMkXDsf17zdPlnK0nxXSp
	X5516E/EIUXsKj1Dn0T1ftXfOhocOu7OiRjVzbZZZcGUTA0ZxWQzGzIeGZ0Q1Erpq0An
	TxE3naj3++5bw6MpEN4ckTtAhOJBIN2TiZHOUSaZDEs0jpAuq9eSeihnvjqjEzSkFXWm
	JnLlFmLCSF62xvVpcHBNf55ByVrrxBQBm98uVI/alGeoJhE3rkPzF2DtRl9XqbTnU9dh
	6Dqc2ElzpSD+etV5bwj4Z22KmVdtjWvDsh+W95E6HHRnwVl+69FSKUi3Uei8J3K4oDAk
	cg/Q==
X-Gm-Message-State: APjAAAV/iskGiLjkeWuOIR2sB99njr0MRzssrO3Mz0SBKcEtSJNB1ibj
	TW5nPijFCHAZJkJIux8zoJ72h8cbi0DWWtzBkN7a
X-Google-Smtp-Source: APXvYqy5NenDRP+GLKo9J8quNnfqfhyEzEl8NSpHCWF7mi5ljohn5db2MdvAsLqzUXcY1Lu1XrqhV/m/a9rdNNnHFD8=
X-Received: by 2002:a19:7515:: with SMTP id y21mr2766879lfe.45.1579728591582; 
	Wed, 22 Jan 2020 13:29:51 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577736799.git.rgb@redhat.com>
	<5941671b6b6b5de28ab2cc80e72f288cf83291d5.1577736799.git.rgb@redhat.com>
In-Reply-To: <5941671b6b6b5de28ab2cc80e72f288cf83291d5.1577736799.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 22 Jan 2020 16:29:39 -0500
Message-ID: <CAHC9VhQYXQp+C0EHwLuW50yUenfH4KF1xKQdS=bn_OzHfnFmmg@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 16/16] audit: add capcontid to set contid
	outside init_user_ns
To: Richard Guy Briggs <rgb@redhat.com>
X-MC-Unique: oUI3SiL_NTeunoMi66qDxg-1
X-MC-Unique: cxfd848YNv68KBKUVl71tg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00MLTt9N003723
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, mpatel@redhat.com,
	Serge Hallyn <serge@hallyn.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 31, 2019 at 2:51 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Provide a mechanism similar to CAP_AUDIT_CONTROL to explicitly give a
> process in a non-init user namespace the capability to set audit
> container identifiers.
>
> Provide /proc/$PID/audit_capcontid interface to capcontid.
> Valid values are: 1==enabled, 0==disabled

It would be good to be more explicit about "enabled" and "disabled" in
the commit description.  For example, which setting allows the target
task to set audit container IDs of it's children processes?

> Report this action in message type AUDIT_SET_CAPCONTID 1022 with fields
> opid= capcontid= old-capcontid=
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  fs/proc/base.c             | 55 ++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/audit.h      | 14 ++++++++++++
>  include/uapi/linux/audit.h |  1 +
>  kernel/audit.c             | 35 +++++++++++++++++++++++++++++
>  4 files changed, 105 insertions(+)

...

> diff --git a/fs/proc/base.c b/fs/proc/base.c
> index 26091800180c..283ef8e006e7 100644
> --- a/fs/proc/base.c
> +++ b/fs/proc/base.c
> @@ -1360,6 +1360,59 @@ static ssize_t proc_contid_write(struct file *file, const char __user *buf,
>         .write          = proc_contid_write,
>         .llseek         = generic_file_llseek,
>  };
> +
> +static ssize_t proc_capcontid_read(struct file *file, char __user *buf,
> +                                 size_t count, loff_t *ppos)
> +{
> +       struct inode *inode = file_inode(file);
> +       struct task_struct *task = get_proc_task(inode);
> +       ssize_t length;
> +       char tmpbuf[TMPBUFLEN];
> +
> +       if (!task)
> +               return -ESRCH;
> +       /* if we don't have caps, reject */
> +       if (!capable(CAP_AUDIT_CONTROL) && !audit_get_capcontid(current))
> +               return -EPERM;
> +       length = scnprintf(tmpbuf, TMPBUFLEN, "%u", audit_get_capcontid(task));
> +       put_task_struct(task);
> +       return simple_read_from_buffer(buf, count, ppos, tmpbuf, length);
> +}
> +
> +static ssize_t proc_capcontid_write(struct file *file, const char __user *buf,
> +                                  size_t count, loff_t *ppos)
> +{
> +       struct inode *inode = file_inode(file);
> +       u32 capcontid;
> +       int rv;
> +       struct task_struct *task = get_proc_task(inode);
> +
> +       if (!task)
> +               return -ESRCH;
> +       if (*ppos != 0) {
> +               /* No partial writes. */
> +               put_task_struct(task);
> +               return -EINVAL;
> +       }
> +
> +       rv = kstrtou32_from_user(buf, count, 10, &capcontid);
> +       if (rv < 0) {
> +               put_task_struct(task);
> +               return rv;
> +       }
> +
> +       rv = audit_set_capcontid(task, capcontid);
> +       put_task_struct(task);
> +       if (rv < 0)
> +               return rv;
> +       return count;
> +}
> +
> +static const struct file_operations proc_capcontid_operations = {
> +       .read           = proc_capcontid_read,
> +       .write          = proc_capcontid_write,
> +       .llseek         = generic_file_llseek,
> +};
>  #endif
>
>  #ifdef CONFIG_FAULT_INJECTION
> @@ -3121,6 +3174,7 @@ static int proc_stack_depth(struct seq_file *m, struct pid_namespace *ns,
>         REG("loginuid",   S_IWUSR|S_IRUGO, proc_loginuid_operations),
>         REG("sessionid",  S_IRUGO, proc_sessionid_operations),
>         REG("audit_containerid", S_IWUSR|S_IRUSR, proc_contid_operations),
> +       REG("audit_capcontainerid", S_IWUSR|S_IRUSR|S_IRUSR, proc_capcontid_operations),
>  #endif
>  #ifdef CONFIG_FAULT_INJECTION
>         REG("make-it-fail", S_IRUGO|S_IWUSR, proc_fault_inject_operations),
> @@ -3522,6 +3576,7 @@ static int proc_tid_comm_permission(struct inode *inode, int mask)
>         REG("loginuid",  S_IWUSR|S_IRUGO, proc_loginuid_operations),
>         REG("sessionid",  S_IRUGO, proc_sessionid_operations),
>         REG("audit_containerid", S_IWUSR|S_IRUSR, proc_contid_operations),
> +       REG("audit_capcontainerid", S_IWUSR|S_IRUSR|S_IRUSR, proc_capcontid_operations),
>  #endif
>  #ifdef CONFIG_FAULT_INJECTION
>         REG("make-it-fail", S_IRUGO|S_IWUSR, proc_fault_inject_operations),
> diff --git a/include/linux/audit.h b/include/linux/audit.h
> index 28b9c7cd86a6..62c453306c2a 100644
> --- a/include/linux/audit.h
> +++ b/include/linux/audit.h
> @@ -116,6 +116,7 @@ struct audit_task_info {
>         kuid_t                  loginuid;
>         unsigned int            sessionid;
>         struct audit_contobj    *cont;
> +       u32                     capcontid;

Where is the code change that actually uses this to enforce the
described policy on setting an audit container ID?

> diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
> index 2844d78cd7af..01251e6dcec0 100644
> --- a/include/uapi/linux/audit.h
> +++ b/include/uapi/linux/audit.h
> @@ -73,6 +73,7 @@
>  #define AUDIT_GET_FEATURE      1019    /* Get which features are enabled */
>  #define AUDIT_CONTAINER_OP     1020    /* Define the container id and info */
>  #define AUDIT_SIGNAL_INFO2     1021    /* Get info auditd signal sender */
> +#define AUDIT_SET_CAPCONTID    1022    /* Set cap_contid of a task */
>
>  #define AUDIT_FIRST_USER_MSG   1100    /* Userspace messages mostly uninteresting to kernel */
>  #define AUDIT_USER_AVC         1107    /* We filter this differently */
> diff --git a/kernel/audit.c b/kernel/audit.c
> index 1287f0b63757..1c22dd084ae8 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -2698,6 +2698,41 @@ static bool audit_contid_isowner(struct task_struct *tsk)
>         return false;
>  }
>
> +int audit_set_capcontid(struct task_struct *task, u32 enable)
> +{
> +       u32 oldcapcontid;
> +       int rc = 0;
> +       struct audit_buffer *ab;
> +
> +       if (!task->audit)
> +               return -ENOPROTOOPT;
> +       oldcapcontid = audit_get_capcontid(task);
> +       /* if task is not descendant, block */
> +       if (task == current)
> +               rc = -EBADSLT;
> +       else if (!task_is_descendant(current, task))
> +               rc = -EXDEV;

See my previous comments about error code sanity.

> +       else if (current_user_ns() == &init_user_ns) {
> +               if (!capable(CAP_AUDIT_CONTROL) && !audit_get_capcontid(current))
> +                       rc = -EPERM;

I think we just want to use ns_capable() in the context of the current
userns to check CAP_AUDIT_CONTROL, yes?  Something like this ...

  if (current_user_ns() != &init_user_ns) {
    if (!ns_capable(CAP_AUDIT_CONTROL) || !audit_get_capcontid())
      rc = -EPERM;
  } else if (!capable(CAP_AUDIT_CONTROL))
    rc = -EPERM;

> +       }
> +       if (!rc)
> +               task->audit->capcontid = enable;
> +
> +       if (!audit_enabled)
> +               return rc;
> +
> +       ab = audit_log_start(audit_context(), GFP_KERNEL, AUDIT_SET_CAPCONTID);
> +       if (!ab)
> +               return rc;
> +
> +       audit_log_format(ab,
> +                        "opid=%d capcontid=%u old-capcontid=%u",
> +                        task_tgid_nr(task), enable, oldcapcontid);
> +       audit_log_end(ab);

My prior comments about recording the success/failure, or not emitting
the record on failure, seem relevant here too.

> +       return rc;
> +}

--
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

