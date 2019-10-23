Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 3F31EE206A
	for <lists+linux-audit@lfdr.de>; Wed, 23 Oct 2019 18:20:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571847643;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7jydyrUnqtXRLvx1ouwnFLeM5acCXKV3ZdUMsqn1/oM=;
	b=doH53uBanPh2XpQ7ROBOwfummvmrjjOfUKhlxLjceKWI4Ck0AQDOgbf3E6zP/zecozpztH
	7S8z1jAUGH77iABQn/FnUP41EBTtd5AGgZm03MX2L7z1rZrXcL/syrYpPlKudKatzURODE
	8v/bc5dwdF+AqsWOwlsYEiAVx4K48yE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-mB2Ek0KGODWN-yy8xDzkdg-1; Wed, 23 Oct 2019 12:20:41 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D31491800D6B;
	Wed, 23 Oct 2019 16:20:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 776AF60BE1;
	Wed, 23 Oct 2019 16:20:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C189718037CD;
	Wed, 23 Oct 2019 16:20:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9NGKHQG004070 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 23 Oct 2019 12:20:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 364E65EE1D; Wed, 23 Oct 2019 16:20:17 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-117-64.phx2.redhat.com [10.3.117.64])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 724B15D70D;
	Wed, 23 Oct 2019 16:20:13 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: linux-audit@redhat.com
Subject: Re: shadow: what uid to log?
Date: Wed, 23 Oct 2019 12:20:13 -0400
Message-ID: <3027837.ooMb3ITpCv@x2>
Organization: Red Hat
In-Reply-To: <CAJ2a_Dcm0ehsAPUb27DdamBbho7=RMhHxeFrM=yKz+vcAN-dpA@mail.gmail.com>
References: <CAJ2a_Dcm0ehsAPUb27DdamBbho7=RMhHxeFrM=yKz+vcAN-dpA@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9NGKHQG004070
X-loop: linux-audit@redhat.com
Cc: Christian =?ISO-8859-1?Q?G=F6ttsche?= <cgzones@googlemail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: mB2Ek0KGODWN-yy8xDzkdg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Thursday, October 17, 2019 5:05:56 PM EDT Christian G=F6ttsche wrote:
> I am working on migrating src:shadow to today's SELinux api and
> enabling audit logging for denials.

>From within the application? It seems that policy could be/is written to=
=20
block execution and prevent any changes. That is, unless you are allowing f=
ine=20
grained controls like you can update the password but not the user name or=
=20
anything else in the database.

> The question which uid to log with 'audit_log_user_avc_message' came up.

This is normally thought of in a client/server situation such as dbus (syst=
em=20
not session). Dbus runs as root and has no associated login uid so in this=
=20
case you would want to know who dbus was making a decision for. It would kn=
ow=20
who the peer is.

In the case where the application is invoked by the user, just use the uid =
to=20
whatever the account is that is being operated on. In the case where no=20
account exists because it is being created, then use -1.

> What is preferred for the applications like passwd, chfn, ... , which
> might be setuid binaries (getuid, geteuid, 0)?

Hope this helps...

-Steve



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

