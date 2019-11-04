Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 028ADEE2C1
	for <lists+linux-audit@lfdr.de>; Mon,  4 Nov 2019 15:42:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572878522;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XETWMdQ8TglOK5Gfwi4U/+4lwL/TVrmw8XtWf14lA40=;
	b=JuvVcxKh0rjoPiCd4mRz4ofKmMUjChhCG7VQL/5b5SB/txm2mCS1GSDAfnFPdtdkynUab2
	/AAx0NZzSkPObHGfHRExLAc6jYGHsIxergwWIsfPicmFkTEDnIWZNweenI6H3hMESn1a8h
	zgcyKPQvNIG18nYyA0bxuLyW/JpQJ+8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-UzPJXwOMPTeQcmEhIDM1PQ-1; Mon, 04 Nov 2019 09:41:59 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 629EB107ACC2;
	Mon,  4 Nov 2019 14:41:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D46E600CC;
	Mon,  4 Nov 2019 14:41:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7F9E118089D6;
	Mon,  4 Nov 2019 14:41:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA4D5hf6012337 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 4 Nov 2019 08:05:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 76DB065E84; Mon,  4 Nov 2019 13:05:43 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from localhost (ovpn-204-125.brq.redhat.com [10.40.204.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 048C31D7;
	Mon,  4 Nov 2019 13:05:20 +0000 (UTC)
Date: Mon, 4 Nov 2019 14:05:18 +0100
From: Jiri Benc <jbenc@redhat.com>
To: Jiri Olsa <jolsa@redhat.com>
Subject: Re: [RFC] audit support for BPF notification
Message-ID: <20191104140518.67471654@redhat.com>
In-Reply-To: <20190820135453.GH24105@krava>
References: <20190809141831.GB9377@krava> <2985228.9kGasGrDWd@x2>
	<20190812075922.GA3012@krava> <5293423.BmRMD7FMx9@x2>
	<20190812143257.GC23992@krava> <20190814073323.GA16363@krava>
	<20190820135453.GH24105@krava>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 04 Nov 2019 09:41:36 -0500
Cc: Arnaldo, Rashid Khan <rkhan@redhat.com>, Kozina <skozina@redhat.com>,
	Yauheni Kaliuta <yauheni.kaliuta@redhat.com>,
	Toke =?UTF-8?B?SMO4aWxhbmQtSsO4cmdlbnNlbg==?= <toke@redhat.com>,
	Carvalho de Melo <acme@redhat.com>, linux-audit@redhat.com,
	Jesper Dangaard Brouer <brouer@redhat.com>,
	Petr Matousek <pmatouse@redhat.com>, Stanislav,
	Vlad Dronov <vdronov@redhat.com>
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
X-MC-Unique: UzPJXwOMPTeQcmEhIDM1PQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Seems there have been no reply to this...=20

Jiri, what is the current status?

Vlad, what is the Product Security's view on this? Is the audit support
for bpf programs loading/unloading a requirement for full support of
eBPF (as opposed to tech preview)?

Thanks,

 Jiri

On Tue, 20 Aug 2019 15:54:53 +0200, Jiri Olsa wrote:
> cc-ing Petr Matousek
>=20
> jirka
>=20
> On Wed, Aug 14, 2019 at 09:33:34AM +0200, Jiri Olsa wrote:
> > hi,
> > Adding Vlad Dronov to the loop, because he asked
> > about this functionality some time ago.
> >=20
> > Vlad, the full thread can be found in here:
> >   https://www.redhat.com/archives/linux-audit/2019-August/msg00004.html
> >=20
> > Any thoughts on this?
> >=20
> > thanks,
> > jirka
> >=20
> > On Mon, Aug 12, 2019 at 04:33:10PM +0200, Jiri Olsa wrote: =20
> > > On Mon, Aug 12, 2019 at 09:49:43AM -0400, Steve Grubb wrote: =20
> > > > On Monday, August 12, 2019 3:59:22 AM EDT Jiri Olsa wrote: =20
> > > > > On Fri, Aug 09, 2019 at 01:45:21PM -0400, Steve Grubb wrote: =20
> > > > > > Hello,
> > > > > >=20
> > > > > > On Friday, August 9, 2019 10:18:31 AM EDT Jiri Olsa wrote: =20
> > > > > > > I posted initial change that allows auditd to log BPF program
> > > > > > >=20
> > > > > > > load/unload events, it's in here:
> > > > > > >   https://github.com/linux-audit/audit-userspace/pull/104 =20
> > > > > >=20
> > > > > > Thanks for the patch...but we probably should have talked a bit=
 more
> > > > > > before undertaking this effort. We normally do not audit from u=
ser space
> > > > > > what happens in the kernel. Doing this can be racy and it keeps=
 auditd
> > > > > > from doing the one job it has - which is to grab events and rec=
ord them
> > > > > > to disk and send them out the realtime interface.
> > > > > >  =20
> > > > > > > We tried to push pure AUDIT interface for BPF program notific=
ation,
> > > > > > >=20
> > > > > > > but it was denied, the discussion is in here:
> > > > > > >   https://marc.info/?t=3D153866123200003&r=3D1&w=3D2 =20
> > > > > >=20
> > > > > > Hmm. The email I remember was here:
> > > > > > https://www.redhat.com/archives/linux-audit/2018-October/msg000=
53.html
> > > > > >=20
> > > > > > and was only 2 emails long with no answer to my question. :-) =
=20
> > > > >=20
> > > > > oops, sry about that, your question was: =20
> > > > > =09> I'm not sure exactly what the issue is. You can audit for sp=
ecific
> > > > > =09> syscall
> > > > > =09> and argument. So, if you want to see loads, then you can mak=
e a rule
> > > > > =09> like:
> > > > > =09>=20
> > > > > =09> -a always,exit -F arch=3Db64 -S bpf -F a0=3D5 =20
> > > > >=20
> > > > > The problem with above for us is that we also:
> > > > >=20
> > > > >   - need to log also other properties of the BPF program,
> > > > >     which are not visible from BPF syscall arguments, like
> > > > >     its ID, JIT status  =20
> > > >=20
> > > > The way this is normally done is to add a supplemental record. For =
example,=20
> > > > when auditing the open syscall, we also get CWD & PATH supplemental=
 records.=20
> > > > When auditing connect, we get a SOCKADDR supplemental record. We ha=
ve=20
> > > > requirements around selective audit whereby the admin is in control=
 of what=20
> > > > is selected for audit via audit rules. So, what one could do is set=
 a rule=20
> > > > for the bpf syscall and then when it triggers, we get these other r=
ecords=20
> > > > added to the bpf syscall event. =20
> > >=20
> > > right, that was the initial plan, but BPF guys wanted just
> > > single notification system without specific hooks for audit,
> > > so we ended up with perf specific interface
> > >  =20
> > > > >     or license info =20
> > > >=20
> > > > This ^^ is not a security issue.
> > > >=20
> > > >  =20
> > > > >   - need to see BPF program UNLOAD, which is not done
> > > > >     via syscall, so those would be unvisible at all =20
> > > >=20
> > > > Is there a place in the kernel where this happens? I could see abno=
rmal=20
> > > > termination being something we might want. Does the program go thro=
ugh=20
> > > > something like an exit syscall internally? =20
> > >=20
> > > it's happening in here (kernel/bpf/syscall.c):
> > >=20
> > > =09bpf_prog_put
> > > =09  __bpf_prog_put
> > > =09  {
> > > =09=09    if (atomic_dec_and_test(&prog->aux->refcnt)) {
> > > =09=09=09perf_event_bpf_event(prog, PERF_BPF_EVENT_PROG_UNLOAD, 0);
> > > =09=09=09...
> > > =09  }
> > >=20
> > > BPF program is released when it drops the reference count,
> > > which is normally when its file descriptor is closed.
> > >=20
> > > However it might get pinned and stay alive even when the initial
> > > file descriptor is closed.. and then there's the networking world,
> > > which might have some other specific ways.. but it all ends up
> > > in bpf_prog_put and zero reference count.
> > >  =20
> > > > > > > The outcome of the discussion was to use perf event interface
> > > > > > > for BPF notification and use it in some deamon.. audit was ou=
r
> > > > > > > first choice.
> > > > > > >=20
> > > > > > > thoughts? =20
> > > > > >=20
> > > > > > I'd like to understand what the basic problem is that needs to =
be solved. =20
> > > > >=20
> > > > > we need a way for administrators to see the history of loaded BPF
> > > > > programs, to help investigating issues related to BPF.. and the
> > > > > only BPF interface for this data is through perf ring buffer =20
> > > >=20
> > > > That is really not the audit way. Let's keep talking to see where t=
his ends=20
> > > > up. =20
> > >=20
> > > Would you see some other auditing daemon/app in place for this kind o=
f data?
> > >=20
> > > thanks,
> > > jirka =20

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

