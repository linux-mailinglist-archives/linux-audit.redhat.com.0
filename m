Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7D3F8147275
	for <lists+linux-audit@lfdr.de>; Thu, 23 Jan 2020 21:16:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579810568;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=A7BHqu8VaWb6zmvZNR0B75nb8Ct7uco+zWiCE+/EKjc=;
	b=JIeGThO45ET0n2aQbpue88RGMF3gLUgpRRJKeOcYZ9G5nZ5ME2ySlDBRMMebyrSCObvPSW
	alWwlbJ6E85GgBpFRW/NHuQ1nxmClexkx8bINWDquVMfrLEK7hEHuzbLfngNJAfrlrVSAJ
	kjWwNPsn/6epo6+pHZm5PW+dh5IylAo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-ei1X8jmIO3SYYV2Tk07IqA-1; Thu, 23 Jan 2020 15:16:01 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6729107ACCA;
	Thu, 23 Jan 2020 20:15:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A4165C1B2;
	Thu, 23 Jan 2020 20:15:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0918C1803C33;
	Thu, 23 Jan 2020 20:15:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00NKFnqa031154 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 23 Jan 2020 15:15:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EE0905C28D; Thu, 23 Jan 2020 20:15:49 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-12.phx2.redhat.com [10.3.112.12])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 380BB5C1B2;
	Thu, 23 Jan 2020 20:15:44 +0000 (UTC)
Date: Thu, 23 Jan 2020 15:15:41 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak28 V4] audit: log audit netlink multicast bind and
	unbind events
Message-ID: <20200123201541.emtse6l5wrnrpqgc@madcap2.tricolour.ca>
References: <ca70ee17d85860aa599e0001a75d639d819de7ae.1579292286.git.rgb@redhat.com>
	<CAHC9VhR9p+aOTzv7g-ujuMsMtLvOZKkoKJWsthZnj38rzJe1TA@mail.gmail.com>
	<20200122230742.7vwtvmhhjerray5f@madcap2.tricolour.ca>
	<CAHC9VhTcv9E8DUDJ2Y-PzXmU0_+ufVydbPB3Q_Fhb8-7TUZMmg@mail.gmail.com>
	<20200123161349.z55l2dd7qsyhoxbn@madcap2.tricolour.ca>
	<CAHC9VhTEfZXCV6TwJ4KOoDCea3x5i85_gBmMi=cygGG9OQCGOQ@mail.gmail.com>
	<20200123185149.sr4b4u4s2ec7renc@madcap2.tricolour.ca>
	<CAHC9VhSPwfNqqoMid+bHRa-XTj4b+DbE6+ov8=MsCxMBuHbjWg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhSPwfNqqoMid+bHRa-XTj4b+DbE6+ov8=MsCxMBuHbjWg@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
Cc: Eric Paris <eparis@parisplace.org>, nhorman@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: ei1X8jmIO3SYYV2Tk07IqA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-01-23 14:07, Paul Moore wrote:
> On Thu, Jan 23, 2020 at 1:52 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2020-01-23 11:57, Paul Moore wrote:
> > > On Thu, Jan 23, 2020 at 11:14 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > > On 2020-01-23 09:32, Paul Moore wrote:
> > > > > On Wed, Jan 22, 2020 at 6:07 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > > > > On 2020-01-22 17:40, Paul Moore wrote:
> > > > > > > On Fri, Jan 17, 2020 at 3:21 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > > >
> > > > > ...
> > > > >
> > > > > > > > diff --git a/kernel/audit.c b/kernel/audit.c
> > > > > > > > index 17b0d523afb3..478259f3fa53 100644
> > > > > > > > --- a/kernel/audit.c
> > > > > > > > +++ b/kernel/audit.c
> > > > > > > > @@ -1520,20 +1520,60 @@ static void audit_receive(struct sk_buff  *skb)
> > > > > > > >         audit_ctl_unlock();
> > > > > > > >  }
> > > > > > > >
> > > > > > > > +/* Log information about who is connecting to the audit multicast socket */
> > > > > > > > +static void audit_log_multicast_bind(int group, const char *op, int err)
> > > > > > > > +{
> > > > > > > > +       const struct cred *cred;
> > > > > > > > +       struct tty_struct *tty;
> > > > > > > > +       char comm[sizeof(current->comm)];
> > > > > > > > +       struct audit_buffer *ab;
> > > > > > > > +
> > > > > > > > +       if (!audit_enabled)
> > > > > > > > +               return;
> > > > > > > > +
> > > > > > > > +       ab = audit_log_start(audit_context(), GFP_KERNEL, AUDIT_EVENT_LISTENER);
> > > > > > > > +       if (!ab)
> > > > > > > > +               return;
> > > > > > > > +
> > > > > > > > +       cred = current_cred();
> > > > > > > > +       tty = audit_get_tty();
> > > > > > > > +       audit_log_format(ab, "pid=%u uid=%u auid=%u tty=%s ses=%u",
> > > > > > > > +                        task_pid_nr(current),
> > > > > > > > +                        from_kuid(&init_user_ns, cred->uid),
> > > > > > > > +                        from_kuid(&init_user_ns, audit_get_loginuid(current)),
> > > > > > > > +                        tty ? tty_name(tty) : "(none)",
> > > > > > > > +                        audit_get_sessionid(current));
> > > > > > >
> > > > > > > Don't we already get all of that information as part of the syscall record?
> > > > > >
> > > > > > Yes.  However, the syscall record isn't always present.  One example is
> > > > > > systemd, shown above.
> > > > >
> > > > > Assuming that the system supports syscall auditing, the absence of a
> > > > > syscall record is a configuration choice made by the admin.  If the
> > > > > system doesn't support syscall auditing the obvious "fix" is to do the
> > > > > work to enable syscall auditing on that platform ... but now we're
> > > > > starting to get off topic.
> > > >
> > > > Well, the system did spit out a syscall record with the example above,
> > > > so it has support for syscall auditing.
> > > >
> > > > I'm testing on f30 with an upstream kernel, the standard 30-stig ruleset and
> > > > with kernel command line audit=1.  What else is needed to support a syscall
> > > > record on systemd before any audit rules have been put in place?  We may still
> > > > have a bug here that affects early process auditing.  What am I missing?
> > > >
> > > > If we can get that sorted out, we don't need subject attributes in this record.
> > >
> > > It looks like some debugging is in order.  There must be some sort of
> > > action initiated by userspace which is causing the multicast
> > > "op=connect", right?  Find out what that is and why it isn't
> > > generating a syscall record (maybe it's not a syscall? I don't know
> > > what systemd is doing here).
> >
> > One clue is that subj=kernel and auid, ttye and ses are unset, despite
> > the rest checking out:
> >         pid=1 uid=root auid=unset tty=(none) ses=unset subj=kernel comm=systemd exe=/usr/lib/systemd/systemd
> 
> Does Fedora use systemd in its initramfs (I'm guessing the answer is
> "yes")?  If so, I wonder if that is the source of this record.

Asking around, I got: "yes, dracut uses systemd these days"

So, yes, that is the source of this record.

So if there is no syscall associated with that record, it appears we
need those subject attributes.

Next question, why do the other records generated from the test not
automatically trigger a syscall record when audit=1 on the kernel
command line?

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

