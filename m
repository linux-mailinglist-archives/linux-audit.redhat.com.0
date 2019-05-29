Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 655AD2E11B
	for <lists+linux-audit@lfdr.de>; Wed, 29 May 2019 17:31:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6744120260;
	Wed, 29 May 2019 15:30:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE91F5D9C3;
	Wed, 29 May 2019 15:30:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EEF841806B14;
	Wed, 29 May 2019 15:30:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4TFTede029622 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 29 May 2019 11:29:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A146D18EE2; Wed, 29 May 2019 15:29:40 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9842018EC0
	for <linux-audit@redhat.com>; Wed, 29 May 2019 15:29:38 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9A1F6308FEE2
	for <linux-audit@redhat.com>; Wed, 29 May 2019 15:29:18 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id h19so2919718ljj.4
	for <linux-audit@redhat.com>; Wed, 29 May 2019 08:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zGaoYWpZqQThaCeamoLFUvuaep53rUnIcLcyCp5w/vg=;
	b=K16i45JTnOhNMfVGcEM3dEc/HE4jxUF98k+I1d4LAg3DOuRJvQylZri7olnMGkge0H
	4u/1DHCKb96WcllkEwg/MgRcL7L1CCWB/hO2xL6zPqW540FOdvpqq8ULGBnZRtoyr3fP
	/dGrfil607dUvRtiW7bu8V4ywrGKbWRLqU6mf6azB7C8mCUui5dBAoSANEn7un7OuRYk
	IqepsvKsbnqV/1oKEERjHclI3LARwVOrafGfm/8g8m245GMvIADoi+bQuHeE9itYkX84
	p6l1akwBNRSzQLd+wftooHrEfiVN9zwWBxGF+rHhkqPeWkDXyPffgp3T4WNSYiCr0lTu
	+NzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zGaoYWpZqQThaCeamoLFUvuaep53rUnIcLcyCp5w/vg=;
	b=ojHUDm6J/RFkF+1jSVkKaWZ17/sdPg9qhF5XIc0sw7IY8TZTAcUynImQkamP8gOJua
	Moxj3/JnFV8sTSqQml4cAP/dm+61Ki28FMYFoqTFy3UR3WdqiEt9zKbr8zQf3TZSOEix
	TJWfPKaaRkHhyb7yrBBJoer2nzd7X5eTv0ywJeecmXMAgtjuL3jJnS0BjuTsGmF13m1j
	zzv/mrBEsBFaVZc37RGW57igRqb4Eev4Gq4PmHlbKJm+zRbekVjSV+HHffFMud7jqmAm
	lR70kd09iZzXTCWpjWgljWjLRWEjhuxAEc6d0mrOW/3nqMysMC63LIpvcee12qmPi9Yn
	22rA==
X-Gm-Message-State: APjAAAV+Kavx4Wuf/n5Lj1eXRgwmey5r4wwdTLGj30iqUZlD+jy/43bu
	+Z+dZUkUWvvj6ee3HMQu5rdTha2w9bow2hAXRJfr
X-Google-Smtp-Source: APXvYqzA1he5CqqTYdGxCaEGH42J2+OT0TC3I1+seVKjcqbN4107AbF/Fb/yxBclhcMIQ95Q2dNrHCvd5kXZOEP8NA8=
X-Received: by 2002:a2e:92cc:: with SMTP id k12mr2501807ljh.16.1559143756865; 
	Wed, 29 May 2019 08:29:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1554732921.git.rgb@redhat.com>
	<9edad39c40671fb53f28d76862304cc2647029c6.1554732921.git.rgb@redhat.com>
	<20190529145742.GA8959@cisco>
In-Reply-To: <20190529145742.GA8959@cisco>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 29 May 2019 11:29:05 -0400
Message-ID: <CAHC9VhR4fudQanvZGYWMvCf7k2CU3q7e7n1Pi7hzC3v_zpVEdw@mail.gmail.com>
Subject: Re: [PATCH ghak90 V6 02/10] audit: add container id
To: Tycho Andersen <tycho@tycho.ws>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Wed, 29 May 2019 15:29:19 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Wed, 29 May 2019 15:29:19 +0000 (UTC) for IP:'209.85.208.194'
	DOMAIN:'mail-lj1-f194.google.com'
	HELO:'mail-lj1-f194.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.008  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_NONE) 209.85.208.194 mail-lj1-f194.google.com 209.85.208.194
	mail-lj1-f194.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, Richard Guy Briggs <rgb@redhat.com>,
	linux-api@vger.kernel.org, containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, Serge Hallyn <serge@hallyn.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Wed, 29 May 2019 15:31:07 +0000 (UTC)

On Wed, May 29, 2019 at 10:57 AM Tycho Andersen <tycho@tycho.ws> wrote:
>
> On Mon, Apr 08, 2019 at 11:39:09PM -0400, Richard Guy Briggs wrote:
> > It is not permitted to unset the audit container identifier.
> > A child inherits its parent's audit container identifier.
>
> ...
>
> >  /**
> > + * audit_set_contid - set current task's audit contid
> > + * @contid: contid value
> > + *
> > + * Returns 0 on success, -EPERM on permission failure.
> > + *
> > + * Called (set) from fs/proc/base.c::proc_contid_write().
> > + */
> > +int audit_set_contid(struct task_struct *task, u64 contid)
> > +{
> > +     u64 oldcontid;
> > +     int rc = 0;
> > +     struct audit_buffer *ab;
> > +     uid_t uid;
> > +     struct tty_struct *tty;
> > +     char comm[sizeof(current->comm)];
> > +
> > +     task_lock(task);
> > +     /* Can't set if audit disabled */
> > +     if (!task->audit) {
> > +             task_unlock(task);
> > +             return -ENOPROTOOPT;
> > +     }
> > +     oldcontid = audit_get_contid(task);
> > +     read_lock(&tasklist_lock);
> > +     /* Don't allow the audit containerid to be unset */
> > +     if (!audit_contid_valid(contid))
> > +             rc = -EINVAL;
> > +     /* if we don't have caps, reject */
> > +     else if (!capable(CAP_AUDIT_CONTROL))
> > +             rc = -EPERM;
> > +     /* if task has children or is not single-threaded, deny */
> > +     else if (!list_empty(&task->children))
> > +             rc = -EBUSY;
> > +     else if (!(thread_group_leader(task) && thread_group_empty(task)))
> > +             rc = -EALREADY;
> > +     read_unlock(&tasklist_lock);
> > +     if (!rc)
> > +             task->audit->contid = contid;
> > +     task_unlock(task);
> > +
> > +     if (!audit_enabled)
> > +             return rc;
>
> ...but it is allowed to change it (assuming
> capable(CAP_AUDIT_CONTROL), of course)? Seems like this might be more
> immediately useful since we still live in the world of majority
> privileged containers if we didn't allow changing it, in addition to
> un-setting it.

The idea is that only container orchestrators should be able to
set/modify the audit container ID, and since setting the audit
container ID can have a significant effect on the records captured
(and their routing to multiple daemons when we get there) modifying
the audit container ID is akin to modifying the audit configuration
which is why it is gated by CAP_AUDIT_CONTROL.  The current thinking
is that you would only change the audit container ID from one
set/inherited value to another if you were nesting containers, in
which case the nested container orchestrator would need to be granted
CAP_AUDIT_CONTROL (which everyone to date seems to agree is a workable
compromise).  We did consider allowing for a chain of nested audit
container IDs, but the implications of doing so are significant
(implementation mess, runtime cost, etc.) so we are leaving that out
of this effort.

>From a practical perspective, un-setting the audit container ID is
pretty much the same as changing it from one set value to another so
most of the above applies to that case as well.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
