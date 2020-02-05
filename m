Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7514E15242A
	for <lists+linux-audit@lfdr.de>; Wed,  5 Feb 2020 01:40:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580863258;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YqvgbY9adjYGuaDI6LULe82bMUwH2zkT7wuZOL9UdUM=;
	b=Nd0WoKi45/Sqz5yPl/5LsaVFVQyp55+BT2bZhgiWueKLOXmrtg33/vUaEysePH0NCommd6
	t4ySobOi+0uY8foN4gimci7fM02t1rcpTcS07FCTmEguiEYG8dzzMCE4ZSr/TFIF0s/Yz9
	JGEsJq1RqO36gRWxq98uKgKejeNOl2g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-MY6gUPqzO7K_obJDokWkxw-1; Tue, 04 Feb 2020 19:40:56 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3894F1084438;
	Wed,  5 Feb 2020 00:40:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 62F2F8DC0A;
	Wed,  5 Feb 2020 00:40:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 152011809567;
	Wed,  5 Feb 2020 00:40:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0150dj2R017565 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 4 Feb 2020 19:39:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 015F684DB8; Wed,  5 Feb 2020 00:39:45 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-16.rdu2.redhat.com
	[10.10.112.16])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD3A9811F8;
	Wed,  5 Feb 2020 00:39:33 +0000 (UTC)
Date: Tue, 4 Feb 2020 19:39:30 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 V8 16/16] audit: add capcontid to set contid
	outside init_user_ns
Message-ID: <20200205003930.2efpm4tvrisgmj4t@madcap2.tricolour.ca>
References: <cover.1577736799.git.rgb@redhat.com>
	<5941671b6b6b5de28ab2cc80e72f288cf83291d5.1577736799.git.rgb@redhat.com>
	<CAHC9VhQYXQp+C0EHwLuW50yUenfH4KF1xKQdS=bn_OzHfnFmmg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhQYXQp+C0EHwLuW50yUenfH4KF1xKQdS=bn_OzHfnFmmg@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: MY6gUPqzO7K_obJDokWkxw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-01-22 16:29, Paul Moore wrote:
> On Tue, Dec 31, 2019 at 2:51 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> >
> > Provide a mechanism similar to CAP_AUDIT_CONTROL to explicitly give a
> > process in a non-init user namespace the capability to set audit
> > container identifiers.
> >
> > Provide /proc/$PID/audit_capcontid interface to capcontid.
> > Valid values are: 1==enabled, 0==disabled
> 
> It would be good to be more explicit about "enabled" and "disabled" in
> the commit description.  For example, which setting allows the target
> task to set audit container IDs of it's children processes?

Ok...

> > Report this action in message type AUDIT_SET_CAPCONTID 1022 with fields
> > opid= capcontid= old-capcontid=
> >
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > ---
> >  fs/proc/base.c             | 55 ++++++++++++++++++++++++++++++++++++++++++++++
> >  include/linux/audit.h      | 14 ++++++++++++
> >  include/uapi/linux/audit.h |  1 +
> >  kernel/audit.c             | 35 +++++++++++++++++++++++++++++
> >  4 files changed, 105 insertions(+)
> 
> ...
> 
> > diff --git a/fs/proc/base.c b/fs/proc/base.c
> > index 26091800180c..283ef8e006e7 100644
> > --- a/fs/proc/base.c
> > +++ b/fs/proc/base.c
> > @@ -1360,6 +1360,59 @@ static ssize_t proc_contid_write(struct file *file, const char __user *buf,
> >         .write          = proc_contid_write,
> >         .llseek         = generic_file_llseek,
> >  };
> > +
> > +static ssize_t proc_capcontid_read(struct file *file, char __user *buf,
> > +                                 size_t count, loff_t *ppos)
> > +{
> > +       struct inode *inode = file_inode(file);
> > +       struct task_struct *task = get_proc_task(inode);
> > +       ssize_t length;
> > +       char tmpbuf[TMPBUFLEN];
> > +
> > +       if (!task)
> > +               return -ESRCH;
> > +       /* if we don't have caps, reject */
> > +       if (!capable(CAP_AUDIT_CONTROL) && !audit_get_capcontid(current))
> > +               return -EPERM;
> > +       length = scnprintf(tmpbuf, TMPBUFLEN, "%u", audit_get_capcontid(task));
> > +       put_task_struct(task);
> > +       return simple_read_from_buffer(buf, count, ppos, tmpbuf, length);
> > +}
> > +
> > +static ssize_t proc_capcontid_write(struct file *file, const char __user *buf,
> > +                                  size_t count, loff_t *ppos)
> > +{
> > +       struct inode *inode = file_inode(file);
> > +       u32 capcontid;
> > +       int rv;
> > +       struct task_struct *task = get_proc_task(inode);
> > +
> > +       if (!task)
> > +               return -ESRCH;
> > +       if (*ppos != 0) {
> > +               /* No partial writes. */
> > +               put_task_struct(task);
> > +               return -EINVAL;
> > +       }
> > +
> > +       rv = kstrtou32_from_user(buf, count, 10, &capcontid);
> > +       if (rv < 0) {
> > +               put_task_struct(task);
> > +               return rv;
> > +       }
> > +
> > +       rv = audit_set_capcontid(task, capcontid);
> > +       put_task_struct(task);
> > +       if (rv < 0)
> > +               return rv;
> > +       return count;
> > +}
> > +
> > +static const struct file_operations proc_capcontid_operations = {
> > +       .read           = proc_capcontid_read,
> > +       .write          = proc_capcontid_write,
> > +       .llseek         = generic_file_llseek,
> > +};
> >  #endif
> >
> >  #ifdef CONFIG_FAULT_INJECTION
> > @@ -3121,6 +3174,7 @@ static int proc_stack_depth(struct seq_file *m, struct pid_namespace *ns,
> >         REG("loginuid",   S_IWUSR|S_IRUGO, proc_loginuid_operations),
> >         REG("sessionid",  S_IRUGO, proc_sessionid_operations),
> >         REG("audit_containerid", S_IWUSR|S_IRUSR, proc_contid_operations),
> > +       REG("audit_capcontainerid", S_IWUSR|S_IRUSR|S_IRUSR, proc_capcontid_operations),
> >  #endif
> >  #ifdef CONFIG_FAULT_INJECTION
> >         REG("make-it-fail", S_IRUGO|S_IWUSR, proc_fault_inject_operations),
> > @@ -3522,6 +3576,7 @@ static int proc_tid_comm_permission(struct inode *inode, int mask)
> >         REG("loginuid",  S_IWUSR|S_IRUGO, proc_loginuid_operations),
> >         REG("sessionid",  S_IRUGO, proc_sessionid_operations),
> >         REG("audit_containerid", S_IWUSR|S_IRUSR, proc_contid_operations),
> > +       REG("audit_capcontainerid", S_IWUSR|S_IRUSR|S_IRUSR, proc_capcontid_operations),
> >  #endif
> >  #ifdef CONFIG_FAULT_INJECTION
> >         REG("make-it-fail", S_IRUGO|S_IWUSR, proc_fault_inject_operations),
> > diff --git a/include/linux/audit.h b/include/linux/audit.h
> > index 28b9c7cd86a6..62c453306c2a 100644
> > --- a/include/linux/audit.h
> > +++ b/include/linux/audit.h
> > @@ -116,6 +116,7 @@ struct audit_task_info {
> >         kuid_t                  loginuid;
> >         unsigned int            sessionid;
> >         struct audit_contobj    *cont;
> > +       u32                     capcontid;
> 
> Where is the code change that actually uses this to enforce the
> described policy on setting an audit container ID?

Oops, lost in shuffle of refactorisation when dumping the netlink code in
favour of /proc.

> > diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
> > index 2844d78cd7af..01251e6dcec0 100644
> > --- a/include/uapi/linux/audit.h
> > +++ b/include/uapi/linux/audit.h
> > @@ -73,6 +73,7 @@
> >  #define AUDIT_GET_FEATURE      1019    /* Get which features are enabled */
> >  #define AUDIT_CONTAINER_OP     1020    /* Define the container id and info */
> >  #define AUDIT_SIGNAL_INFO2     1021    /* Get info auditd signal sender */
> > +#define AUDIT_SET_CAPCONTID    1022    /* Set cap_contid of a task */
> >
> >  #define AUDIT_FIRST_USER_MSG   1100    /* Userspace messages mostly uninteresting to kernel */
> >  #define AUDIT_USER_AVC         1107    /* We filter this differently */
> > diff --git a/kernel/audit.c b/kernel/audit.c
> > index 1287f0b63757..1c22dd084ae8 100644
> > --- a/kernel/audit.c
> > +++ b/kernel/audit.c
> > @@ -2698,6 +2698,41 @@ static bool audit_contid_isowner(struct task_struct *tsk)
> >         return false;
> >  }
> >
> > +int audit_set_capcontid(struct task_struct *task, u32 enable)
> > +{
> > +       u32 oldcapcontid;
> > +       int rc = 0;
> > +       struct audit_buffer *ab;
> > +
> > +       if (!task->audit)
> > +               return -ENOPROTOOPT;
> > +       oldcapcontid = audit_get_capcontid(task);
> > +       /* if task is not descendant, block */
> > +       if (task == current)
> > +               rc = -EBADSLT;
> > +       else if (!task_is_descendant(current, task))
> > +               rc = -EXDEV;
> 
> See my previous comments about error code sanity.

I'll go with EXDEV.

> > +       else if (current_user_ns() == &init_user_ns) {
> > +               if (!capable(CAP_AUDIT_CONTROL) && !audit_get_capcontid(current))
> > +                       rc = -EPERM;
> 
> I think we just want to use ns_capable() in the context of the current
> userns to check CAP_AUDIT_CONTROL, yes?  Something like this ...

I thought we had firmly established in previous discussion that
CAP_AUDIT_CONTROL in anything other than init_user_ns was completely irrelevant
and untrustable.

>   if (current_user_ns() != &init_user_ns) {
>     if (!ns_capable(CAP_AUDIT_CONTROL) || !audit_get_capcontid())
>       rc = -EPERM;
>   } else if (!capable(CAP_AUDIT_CONTROL))
>     rc = -EPERM;
> 
> > +       }
> > +       if (!rc)
> > +               task->audit->capcontid = enable;
> > +
> > +       if (!audit_enabled)
> > +               return rc;
> > +
> > +       ab = audit_log_start(audit_context(), GFP_KERNEL, AUDIT_SET_CAPCONTID);
> > +       if (!ab)
> > +               return rc;
> > +
> > +       audit_log_format(ab,
> > +                        "opid=%d capcontid=%u old-capcontid=%u",
> > +                        task_tgid_nr(task), enable, oldcapcontid);
> > +       audit_log_end(ab);
> 
> My prior comments about recording the success/failure, or not emitting
> the record on failure, seem relevant here too.

It should be recorded in the syscall record.

> > +       return rc;
> > +}
> 
> paul moore

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

