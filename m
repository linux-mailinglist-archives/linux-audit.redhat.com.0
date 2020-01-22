Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC8D145DDF
	for <lists+linux-audit@lfdr.de>; Wed, 22 Jan 2020 22:28:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579728526;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PMpJdZqquETFgGarJ1hf06YbYuIuZjk+7JK2Z+U6M3o=;
	b=OTghdBibDWkyWAn8wgfYo3ZRsGMCZrd7Bsan4AsSujeRAVPADUFL+l2632xaIeNVjKrU/e
	zdqg+9fFFNEQPdYX+sClOldsLXrFwJjbKQjIA74hEwPNGXnfi8UXNwS0Eo0jKe8Q7mB53g
	8v8OpMOwvPPW5SpTXhrFea/bDO1aJlw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-Ct8yY27bMLmaLf7_arSEfA-1; Wed, 22 Jan 2020 16:28:43 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9238C800D48;
	Wed, 22 Jan 2020 21:28:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E25AA1084385;
	Wed, 22 Jan 2020 21:28:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9998218089C8;
	Wed, 22 Jan 2020 21:28:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00MLSJFj003462 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 22 Jan 2020 16:28:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7B71A2166B27; Wed, 22 Jan 2020 21:28:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 773712166B28
	for <linux-audit@redhat.com>; Wed, 22 Jan 2020 21:28:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A30071011E02
	for <linux-audit@redhat.com>; Wed, 22 Jan 2020 21:28:17 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-42-g4JBpmeMPiiqpd0AwR--og-1; Wed, 22 Jan 2020 16:28:15 -0500
Received: by mail-lf1-f67.google.com with SMTP id 203so691073lfa.12
	for <linux-audit@redhat.com>; Wed, 22 Jan 2020 13:28:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UlbIRxeN9Q76SjfgK7QR1Vwr+MWjG4ms1YscK+m3ZzA=;
	b=tU2M2zUt3hBJToiNKj441PsFIJfLJR8Maoivw/vaistmmRYgmM6m/MFxRC+3z0WcTN
	Za5y71lD50bSDU1BzZCL6Y1lLzRT8cY8qe79SqTRLCRIoUYNXg11KUGF0msicibx7TYS
	/lZFSQntJoAzhWXQSYFqqNd7MGKnkmhR1e83Dr6jb7JJAPJcCnbZF38tyeiNeL1SGlCS
	P18Fjc4H0XhKCKuTc+5EQi/CxpvxE4zjJczKWdcWq2Dx9y7MpYDSm8F12mMzZBKUQQvN
	ukh0ZT5kTldt+LcfA1B7ocasKxUtke12bYoX4qPc/V41akhDlfsMvkTBtUuaokp7DPXA
	F0Bw==
X-Gm-Message-State: APjAAAVNx0pCZq3ZOJP5YhRyJ/PCUMRt/Pj3Jp8yLJZHi4Nioi9NPkQ7
	+BJH/aCzHSJnyqnDumzfHh428cTZ6cf7PGPwE84S
X-Google-Smtp-Source: APXvYqzmCy0bZf7U/H8d37zLwqEk/uVU9XMfs5fLgp38rC119ErDsvdLgD7EkL0RZ3pxjNI9STqxXeIxXnoeDiUoytM=
X-Received: by 2002:a19:dc1e:: with SMTP id t30mr2878129lfg.34.1579728493389; 
	Wed, 22 Jan 2020 13:28:13 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577736799.git.rgb@redhat.com>
	<70ad50e69185c50843d5e14462f1c4f03655d503.1577736799.git.rgb@redhat.com>
In-Reply-To: <70ad50e69185c50843d5e14462f1c4f03655d503.1577736799.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 22 Jan 2020 16:28:02 -0500
Message-ID: <CAHC9VhTKE_3bOXs+UcpKDQhatKH92uY3Hy=JA4sXXVGOC0ek8A@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 02/16] audit: add container id
To: Richard Guy Briggs <rgb@redhat.com>
X-MC-Unique: g4JBpmeMPiiqpd0AwR--og-1
X-MC-Unique: Ct8yY27bMLmaLf7_arSEfA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00MLSJFj003462
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

On Tue, Dec 31, 2019 at 2:49 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Implement the proc fs write to set the audit container identifier of a
> process, emitting an AUDIT_CONTAINER_OP record to document the event.
>
> This is a write from the container orchestrator task to a proc entry of
> the form /proc/PID/audit_containerid where PID is the process ID of the
> newly created task that is to become the first task in a container, or
> an additional task added to a container.
>
> The write expects up to a u64 value (unset: 18446744073709551615).
>
> The writer must have capability CAP_AUDIT_CONTROL.
>
> This will produce a record such as this:
>   type=CONTAINER_OP msg=audit(2018-06-06 12:39:29.636:26949) : op=set opid=2209 contid=123456 old-contid=18446744073709551615
>
> The "op" field indicates an initial set.  The "opid" field is the
> object's PID, the process being "contained".  New and old audit
> container identifier values are given in the "contid" fields.
>
> It is not permitted to unset the audit container identifier.
> A child inherits its parent's audit container identifier.
>
> Please see the github audit kernel issue for the main feature:
>   https://github.com/linux-audit/audit-kernel/issues/90
> Please see the github audit userspace issue for supporting additions:
>   https://github.com/linux-audit/audit-userspace/issues/51
> Please see the github audit testsuiite issue for the test case:
>   https://github.com/linux-audit/audit-testsuite/issues/64
> Please see the github audit wiki for the feature overview:
>   https://github.com/linux-audit/audit-kernel/wiki/RFE-Audit-Container-ID
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> Acked-by: Serge Hallyn <serge@hallyn.com>
> Acked-by: Steve Grubb <sgrubb@redhat.com>
> Acked-by: Neil Horman <nhorman@tuxdriver.com>
> Reviewed-by: Ondrej Mosnacek <omosnace@redhat.com>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  fs/proc/base.c             | 36 ++++++++++++++++++++++++++++
>  include/linux/audit.h      | 25 ++++++++++++++++++++
>  include/uapi/linux/audit.h |  2 ++
>  kernel/audit.c             | 58 ++++++++++++++++++++++++++++++++++++++++++++++
>  kernel/audit.h             |  1 +
>  kernel/auditsc.c           |  4 ++++
>  6 files changed, 126 insertions(+)

...

> diff --git a/kernel/audit.c b/kernel/audit.c
> index 397f8fb4836a..2d7707426b7d 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -2356,6 +2358,62 @@ int audit_signal_info(int sig, struct task_struct *t)
>         return audit_signal_info_syscall(t);
>  }
>
> +/*
> + * audit_set_contid - set current task's audit contid
> + * @task: target task
> + * @contid: contid value
> + *
> + * Returns 0 on success, -EPERM on permission failure.
> + *
> + * Called (set) from fs/proc/base.c::proc_contid_write().
> + */
> +int audit_set_contid(struct task_struct *task, u64 contid)
> +{
> +       u64 oldcontid;
> +       int rc = 0;
> +       struct audit_buffer *ab;
> +
> +       task_lock(task);
> +       /* Can't set if audit disabled */
> +       if (!task->audit) {
> +               task_unlock(task);
> +               return -ENOPROTOOPT;
> +       }
> +       oldcontid = audit_get_contid(task);
> +       read_lock(&tasklist_lock);
> +       /* Don't allow the audit containerid to be unset */
> +       if (!audit_contid_valid(contid))
> +               rc = -EINVAL;
> +       /* if we don't have caps, reject */
> +       else if (!capable(CAP_AUDIT_CONTROL))
> +               rc = -EPERM;
> +       /* if task has children or is not single-threaded, deny */
> +       else if (!list_empty(&task->children))
> +               rc = -EBUSY;
> +       else if (!(thread_group_leader(task) && thread_group_empty(task)))
> +               rc = -EALREADY;

[NOTE: there is a bigger issue below which I think is going to require
a respin/fixup of this patch so I'm going to take the opportunity to
do a bit more bikeshedding ;)]

It seems like we could combine both the thread/children checks under a
single -EBUSY return value.  In both cases the caller should be able
to determine if the target process is multi-threaded for has spawned
children, yes?  FWIW, my motivation for this question is that
-EALREADY seems like a poor choice here.

> +       /* if contid is already set, deny */
> +       else if (audit_contid_set(task))
> +               rc = -ECHILD;

Does -EEXIST make more sense here?

> +       read_unlock(&tasklist_lock);
> +       if (!rc)
> +               task->audit->contid = contid;
> +       task_unlock(task);
> +
> +       if (!audit_enabled)
> +               return rc;
> +
> +       ab = audit_log_start(audit_context(), GFP_KERNEL, AUDIT_CONTAINER_OP);
> +       if (!ab)
> +               return rc;
> +
> +       audit_log_format(ab,
> +                        "op=set opid=%d contid=%llu old-contid=%llu",
> +                        task_tgid_nr(task), contid, oldcontid);
> +       audit_log_end(ab);

Assuming audit is enabled we always emit the record above, even if we
were not actually able to set the Audit Container ID (ACID); this
seems wrong to me.  I think the proper behavior would be to either add
a "res=" field to indicate success/failure or only emit the record
when we actually change a task's ACID.  Considering the impact that
the ACID value will potentially have on the audit stream, it seems
like always logging the record and including a "res=" field may be the
safer choice.


> +       return rc;
> +}
> +
>  /**
>   * audit_log_end - end one audit record
>   * @ab: the audit_buffer

--
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

