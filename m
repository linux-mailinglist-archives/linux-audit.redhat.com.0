Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 100E714716E
	for <lists+linux-audit@lfdr.de>; Thu, 23 Jan 2020 20:07:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579806473;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CwkyrPdBSI6hKrYURY24UTpuJ9sRcnW2zAm3VJk5GQY=;
	b=NIZgCvuc7T4eVrzl6H4wLUpULlfOKBCz1i2NrFSbmifnKngFaLO1zjwX4rcVhBpbENG7Bn
	TnO5sH1SZWqBUfFk0jM7FAb2fa6HZQHDL4xLHvHhv+M6PBOi0arRgLzEURwGGFhBVIV5DS
	4QyCJ+06379lhPGxrrBurTv+yaq3JRQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-hNQLyMMlM-CGNaKIiX-afA-1; Thu, 23 Jan 2020 14:07:50 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6DC41005510;
	Thu, 23 Jan 2020 19:07:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FCD587EED;
	Thu, 23 Jan 2020 19:07:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 355C71803C33;
	Thu, 23 Jan 2020 19:07:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00NJ7ZoM026128 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 23 Jan 2020 14:07:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4D3C1105546E; Thu, 23 Jan 2020 19:07:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 489341055462
	for <linux-audit@redhat.com>; Thu, 23 Jan 2020 19:07:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 548F318AE970
	for <linux-audit@redhat.com>; Thu, 23 Jan 2020 19:07:33 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-159-EoogPeuNNt-sPNRVjDXSsQ-1; Thu, 23 Jan 2020 14:07:30 -0500
Received: by mail-lj1-f196.google.com with SMTP id h23so4849730ljc.8
	for <linux-audit@redhat.com>; Thu, 23 Jan 2020 11:07:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=i2Gpo6Tm+7T8oQ/Qs3f0OF4BTKoIqiuFY7JyzM5sw7E=;
	b=d01n6DB1fUVGSUQoFoRWbb2xUhKMaCZ9u5OQobNokQ7w98cgKIQYOYbK1Zw3XEOj4a
	WqD76QvFXyQKWt3thdVuGOnBQaiCyedfb0jTbVZFhBPp1dXJox4YD/FMixDGa6sH2Cv6
	Obuv67bgQlKPjwDnFNG7vDFbCb8dpodxctAiktSWjkZwYRmnJR8ibxhaqi8VDhDH9Sy7
	GJ7580jR1gvx9fk+xziCx3cBMZe5VsRiOOEYxgctC3+JxtUl0s2bZsbsBnZynTN35nV/
	Lwx3sUO3uikrMYl3olc1oi6t+wpJ0MrIALa/IOlZOzsKnjsPLe3l4/1WWg02VXpavisG
	7TGQ==
X-Gm-Message-State: APjAAAUamrU1BLJUJcGi31+3VImto7i/4xGEhgILP7S9X/SkQzt+WL5j
	nnkDFKOd3Squd2ZDKWvZ9JwnKWvIanrC2dJT3Ge3
X-Google-Smtp-Source: APXvYqzcSZmT95hcvF6oSAGXmUIpmo4HprR3bKDc4fX7RZkHAw8c0XOeWvZ394TijbjLtjNN/GTYQ9LdZVy1am5x/To=
X-Received: by 2002:a2e:9b03:: with SMTP id u3mr39960lji.87.1579806448528;
	Thu, 23 Jan 2020 11:07:28 -0800 (PST)
MIME-Version: 1.0
References: <ca70ee17d85860aa599e0001a75d639d819de7ae.1579292286.git.rgb@redhat.com>
	<CAHC9VhR9p+aOTzv7g-ujuMsMtLvOZKkoKJWsthZnj38rzJe1TA@mail.gmail.com>
	<20200122230742.7vwtvmhhjerray5f@madcap2.tricolour.ca>
	<CAHC9VhTcv9E8DUDJ2Y-PzXmU0_+ufVydbPB3Q_Fhb8-7TUZMmg@mail.gmail.com>
	<20200123161349.z55l2dd7qsyhoxbn@madcap2.tricolour.ca>
	<CAHC9VhTEfZXCV6TwJ4KOoDCea3x5i85_gBmMi=cygGG9OQCGOQ@mail.gmail.com>
	<20200123185149.sr4b4u4s2ec7renc@madcap2.tricolour.ca>
In-Reply-To: <20200123185149.sr4b4u4s2ec7renc@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 23 Jan 2020 14:07:17 -0500
Message-ID: <CAHC9VhSPwfNqqoMid+bHRa-XTj4b+DbE6+ov8=MsCxMBuHbjWg@mail.gmail.com>
Subject: Re: [PATCH ghak28 V4] audit: log audit netlink multicast bind and
	unbind events
To: Richard Guy Briggs <rgb@redhat.com>
X-MC-Unique: EoogPeuNNt-sPNRVjDXSsQ-1
X-MC-Unique: hNQLyMMlM-CGNaKIiX-afA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00NJ7ZoM026128
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 23, 2020 at 1:52 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-01-23 11:57, Paul Moore wrote:
> > On Thu, Jan 23, 2020 at 11:14 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > On 2020-01-23 09:32, Paul Moore wrote:
> > > > On Wed, Jan 22, 2020 at 6:07 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > > > On 2020-01-22 17:40, Paul Moore wrote:
> > > > > > On Fri, Jan 17, 2020 at 3:21 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > >
> > > > ...
> > > >
> > > > > > > diff --git a/kernel/audit.c b/kernel/audit.c
> > > > > > > index 17b0d523afb3..478259f3fa53 100644
> > > > > > > --- a/kernel/audit.c
> > > > > > > +++ b/kernel/audit.c
> > > > > > > @@ -1520,20 +1520,60 @@ static void audit_receive(struct sk_buff  *skb)
> > > > > > >         audit_ctl_unlock();
> > > > > > >  }
> > > > > > >
> > > > > > > +/* Log information about who is connecting to the audit multicast socket */
> > > > > > > +static void audit_log_multicast_bind(int group, const char *op, int err)
> > > > > > > +{
> > > > > > > +       const struct cred *cred;
> > > > > > > +       struct tty_struct *tty;
> > > > > > > +       char comm[sizeof(current->comm)];
> > > > > > > +       struct audit_buffer *ab;
> > > > > > > +
> > > > > > > +       if (!audit_enabled)
> > > > > > > +               return;
> > > > > > > +
> > > > > > > +       ab = audit_log_start(audit_context(), GFP_KERNEL, AUDIT_EVENT_LISTENER);
> > > > > > > +       if (!ab)
> > > > > > > +               return;
> > > > > > > +
> > > > > > > +       cred = current_cred();
> > > > > > > +       tty = audit_get_tty();
> > > > > > > +       audit_log_format(ab, "pid=%u uid=%u auid=%u tty=%s ses=%u",
> > > > > > > +                        task_pid_nr(current),
> > > > > > > +                        from_kuid(&init_user_ns, cred->uid),
> > > > > > > +                        from_kuid(&init_user_ns, audit_get_loginuid(current)),
> > > > > > > +                        tty ? tty_name(tty) : "(none)",
> > > > > > > +                        audit_get_sessionid(current));
> > > > > >
> > > > > > Don't we already get all of that information as part of the syscall record?
> > > > >
> > > > > Yes.  However, the syscall record isn't always present.  One example is
> > > > > systemd, shown above.
> > > >
> > > > Assuming that the system supports syscall auditing, the absence of a
> > > > syscall record is a configuration choice made by the admin.  If the
> > > > system doesn't support syscall auditing the obvious "fix" is to do the
> > > > work to enable syscall auditing on that platform ... but now we're
> > > > starting to get off topic.
> > >
> > > Well, the system did spit out a syscall record with the example above,
> > > so it has support for syscall auditing.
> > >
> > > I'm testing on f30 with an upstream kernel, the standard 30-stig ruleset and
> > > with kernel command line audit=1.  What else is needed to support a syscall
> > > record on systemd before any audit rules have been put in place?  We may still
> > > have a bug here that affects early process auditing.  What am I missing?
> > >
> > > If we can get that sorted out, we don't need subject attributes in this record.
> >
> > It looks like some debugging is in order.  There must be some sort of
> > action initiated by userspace which is causing the multicast
> > "op=connect", right?  Find out what that is and why it isn't
> > generating a syscall record (maybe it's not a syscall? I don't know
> > what systemd is doing here).
>
> One clue is that subj=kernel and auid, ttye and ses are unset, despite
> the rest checking out:
>         pid=1 uid=root auid=unset tty=(none) ses=unset subj=kernel comm=systemd exe=/usr/lib/systemd/systemd

Does Fedora use systemd in its initramfs (I'm guessing the answer is
"yes")?  If so, I wonder if that is the source of this record.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

