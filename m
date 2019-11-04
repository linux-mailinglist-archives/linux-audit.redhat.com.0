Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D7434EE2C0
	for <lists+linux-audit@lfdr.de>; Mon,  4 Nov 2019 15:42:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572878521;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CW8A6OqwRkWEzB1BpawS5ov/aZ68kyJEyjthfGplZC0=;
	b=bPXhi5QBEzBg+odamztATE0S2Lqdwfsa5G8zQRPcdeykfQqqdLF3B79ZLSAbsHBxtLxUwA
	lGJgxal0UvBKsvYWtJZNRVc6JuLb4WM9LxOPzMDRteT8pZLGYDKaetdtzY/B20vP6ReKgp
	XJpvbJi9xR1cClQ522yBzzmVyXM9Prg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-IIoKCAlRPgyl3XblB_SiXw-1; Mon, 04 Nov 2019 09:41:59 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82125477;
	Mon,  4 Nov 2019 14:41:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A7F33600C4;
	Mon,  4 Nov 2019 14:41:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7F80B18089D5;
	Mon,  4 Nov 2019 14:41:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA4DSG3H013768 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 4 Nov 2019 08:28:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8E51E1A8D7; Mon,  4 Nov 2019 13:28:16 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from krava (unknown [10.43.17.48])
	by smtp.corp.redhat.com (Postfix) with SMTP id 77BD419C4F;
	Mon,  4 Nov 2019 13:28:03 +0000 (UTC)
Date: Mon, 4 Nov 2019 14:28:02 +0100
From: Jiri Olsa <jolsa@redhat.com>
To: Jiri Benc <jbenc@redhat.com>
Subject: Re: [RFC] audit support for BPF notification
Message-ID: <20191104132802.GF8251@krava>
References: <20190809141831.GB9377@krava> <2985228.9kGasGrDWd@x2>
	<20190812075922.GA3012@krava> <5293423.BmRMD7FMx9@x2>
	<20190812143257.GC23992@krava> <20190814073323.GA16363@krava>
	<20190820135453.GH24105@krava> <20191104140518.67471654@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191104140518.67471654@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 04 Nov 2019 09:41:36 -0500
Cc: Rashid Khan <rkhan@redhat.com>, Stanislav Kozina <skozina@redhat.com>,
	Yauheni Kaliuta <yauheni.kaliuta@redhat.com>,
	Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>, linux-audit@redhat.com,
	Jesper Dangaard Brouer <brouer@redhat.com>,
	Petr Matousek <pmatouse@redhat.com>, Vlad Dronov <vdronov@redhat.com>
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
X-MC-Unique: IIoKCAlRPgyl3XblB_SiXw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Mon, Nov 04, 2019 at 02:05:18PM +0100, Jiri Benc wrote:
> Seems there have been no reply to this...=20
>=20
> Jiri, what is the current status?

same, there's still no answer from Product Security

jirka

>=20
> Vlad, what is the Product Security's view on this? Is the audit support
> for bpf programs loading/unloading a requirement for full support of
> eBPF (as opposed to tech preview)?
>=20
> Thanks,
>=20
>  Jiri
>=20
> On Tue, 20 Aug 2019 15:54:53 +0200, Jiri Olsa wrote:
> > cc-ing Petr Matousek
> >=20
> > jirka
> >=20
> > On Wed, Aug 14, 2019 at 09:33:34AM +0200, Jiri Olsa wrote:
> > > hi,
> > > Adding Vlad Dronov to the loop, because he asked
> > > about this functionality some time ago.
> > >=20
> > > Vlad, the full thread can be found in here:
> > >   https://www.redhat.com/archives/linux-audit/2019-August/msg00004.ht=
ml
> > >=20
> > > Any thoughts on this?
> > >=20
> > > thanks,
> > > jirka
> > >=20
> > > On Mon, Aug 12, 2019 at 04:33:10PM +0200, Jiri Olsa wrote: =20
> > > > On Mon, Aug 12, 2019 at 09:49:43AM -0400, Steve Grubb wrote: =20
> > > > > On Monday, August 12, 2019 3:59:22 AM EDT Jiri Olsa wrote: =20
> > > > > > On Fri, Aug 09, 2019 at 01:45:21PM -0400, Steve Grubb wrote: =
=20
> > > > > > > Hello,
> > > > > > >=20
> > > > > > > On Friday, August 9, 2019 10:18:31 AM EDT Jiri Olsa wrote: =
=20
> > > > > > > > I posted initial change that allows auditd to log BPF progr=
am
> > > > > > > >=20
> > > > > > > > load/unload events, it's in here:
> > > > > > > >   https://github.com/linux-audit/audit-userspace/pull/104 =
=20
> > > > > > >=20
> > > > > > > Thanks for the patch...but we probably should have talked a b=
it more
> > > > > > > before undertaking this effort. We normally do not audit from=
 user space
> > > > > > > what happens in the kernel. Doing this can be racy and it kee=
ps auditd
> > > > > > > from doing the one job it has - which is to grab events and r=
ecord them
> > > > > > > to disk and send them out the realtime interface.
> > > > > > >  =20
> > > > > > > > We tried to push pure AUDIT interface for BPF program notif=
ication,
> > > > > > > >=20
> > > > > > > > but it was denied, the discussion is in here:
> > > > > > > >   https://marc.info/?t=3D153866123200003&r=3D1&w=3D2 =20
> > > > > > >=20
> > > > > > > Hmm. The email I remember was here:
> > > > > > > https://www.redhat.com/archives/linux-audit/2018-October/msg0=
0053.html
> > > > > > >=20
> > > > > > > and was only 2 emails long with no answer to my question. :-)=
 =20
> > > > > >=20
> > > > > > oops, sry about that, your question was: =20
> > > > > > =09> I'm not sure exactly what the issue is. You can audit for =
specific
> > > > > > =09> syscall
> > > > > > =09> and argument. So, if you want to see loads, then you can m=
ake a rule
> > > > > > =09> like:
> > > > > > =09>=20
> > > > > > =09> -a always,exit -F arch=3Db64 -S bpf -F a0=3D5 =20
> > > > > >=20
> > > > > > The problem with above for us is that we also:
> > > > > >=20
> > > > > >   - need to log also other properties of the BPF program,
> > > > > >     which are not visible from BPF syscall arguments, like
> > > > > >     its ID, JIT status  =20
> > > > >=20
> > > > > The way this is normally done is to add a supplemental record. Fo=
r example,=20
> > > > > when auditing the open syscall, we also get CWD & PATH supplement=
al records.=20
> > > > > When auditing connect, we get a SOCKADDR supplemental record. We =
have=20
> > > > > requirements around selective audit whereby the admin is in contr=
ol of what=20
> > > > > is selected for audit via audit rules. So, what one could do is s=
et a rule=20
> > > > > for the bpf syscall and then when it triggers, we get these other=
 records=20
> > > > > added to the bpf syscall event. =20
> > > >=20
> > > > right, that was the initial plan, but BPF guys wanted just
> > > > single notification system without specific hooks for audit,
> > > > so we ended up with perf specific interface
> > > >  =20
> > > > > >     or license info =20
> > > > >=20
> > > > > This ^^ is not a security issue.
> > > > >=20
> > > > >  =20
> > > > > >   - need to see BPF program UNLOAD, which is not done
> > > > > >     via syscall, so those would be unvisible at all =20
> > > > >=20
> > > > > Is there a place in the kernel where this happens? I could see ab=
normal=20
> > > > > termination being something we might want. Does the program go th=
rough=20
> > > > > something like an exit syscall internally? =20
> > > >=20
> > > > it's happening in here (kernel/bpf/syscall.c):
> > > >=20
> > > > =09bpf_prog_put
> > > > =09  __bpf_prog_put
> > > > =09  {
> > > > =09=09    if (atomic_dec_and_test(&prog->aux->refcnt)) {
> > > > =09=09=09perf_event_bpf_event(prog, PERF_BPF_EVENT_PROG_UNLOAD, 0);
> > > > =09=09=09...
> > > > =09  }
> > > >=20
> > > > BPF program is released when it drops the reference count,
> > > > which is normally when its file descriptor is closed.
> > > >=20
> > > > However it might get pinned and stay alive even when the initial
> > > > file descriptor is closed.. and then there's the networking world,
> > > > which might have some other specific ways.. but it all ends up
> > > > in bpf_prog_put and zero reference count.
> > > >  =20
> > > > > > > > The outcome of the discussion was to use perf event interfa=
ce
> > > > > > > > for BPF notification and use it in some deamon.. audit was =
our
> > > > > > > > first choice.
> > > > > > > >=20
> > > > > > > > thoughts? =20
> > > > > > >=20
> > > > > > > I'd like to understand what the basic problem is that needs t=
o be solved. =20
> > > > > >=20
> > > > > > we need a way for administrators to see the history of loaded B=
PF
> > > > > > programs, to help investigating issues related to BPF.. and the
> > > > > > only BPF interface for this data is through perf ring buffer =
=20
> > > > >=20
> > > > > That is really not the audit way. Let's keep talking to see where=
 this ends=20
> > > > > up. =20
> > > >=20
> > > > Would you see some other auditing daemon/app in place for this kind=
 of data?
> > > >=20
> > > > thanks,
> > > > jirka =20
>=20

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

