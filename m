Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B47DB303095
	for <lists+linux-audit@lfdr.de>; Tue, 26 Jan 2021 00:54:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611618880;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wMNp4VhvExiKcGVgC9Aj2C5BS/VaK3KYhvflQUKNLiU=;
	b=e2vTfaToTaC8SKkRRd6isrxQ/pXJ6K9x4VDheLpi5HbGjDQRRWNa9gIgJdq5iSAjv8+n4o
	HS1N2pvRipjh5056FvUZGsceX7PUbShIFsQuXXEqbz0PBPPKBfhml9NvJ5YsRfgNmiGdVp
	mxaOsP3OhuqvympgPdg7Qr1GNB4tlec=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-re0eB7shPfO0Uek1yhmDwA-1; Mon, 25 Jan 2021 18:54:38 -0500
X-MC-Unique: re0eB7shPfO0Uek1yhmDwA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47649107ACE6;
	Mon, 25 Jan 2021 23:54:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 36AED6F452;
	Mon, 25 Jan 2021 23:54:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 696654A7C6;
	Mon, 25 Jan 2021 23:54:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10PNrxhV011517 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 25 Jan 2021 18:53:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A69A819C47; Mon, 25 Jan 2021 23:53:59 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-117-75.rdu2.redhat.com [10.10.117.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 894FB19C78;
	Mon, 25 Jan 2021 23:53:53 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: burn@swtf.dyndns.org
Subject: Re: Occasional delayed output of events
Date: Mon, 25 Jan 2021 18:53:52 -0500
Message-ID: <11685937.O9o76ZdvQC@x2>
Organization: Red Hat
In-Reply-To: <6484d9c52b66405ecbe76096fd5e896e5626b216.camel@iinet.net.au>
References: <30c5dbc14368a1919717e2f39d2d4c29463c3108.camel@iinet.net.au>
	<CAHC9VhT9N6Ztpt3pwE0CMaHyKrwoOWLZuB3vTnq_mpxnkgvfPQ@mail.gmail.com>
	<6484d9c52b66405ecbe76096fd5e896e5626b216.camel@iinet.net.au>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>, Linux Audit <linux-audit@redhat.com>
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Saturday, January 23, 2021 5:55:44 PM EST Burn Alting wrote:
> > > How is the following for a way forward.
> > > a. I will author a patch to the user space code to correctly parse this
> > > condition and submit it on the weekend. It will be via a new
> > > configuration item to auditd.conf just in case placing a fixed
> > > extended timeout (15-20 secs) affects memory usage for users of the
> > > auparse library. This solves the initial problem of ausearch/auparse
> > > failing to parse generated audit.b. I am happy to instrument what ever
> > > is recommended on my hosts at home (vm's and bare metal) to provide
> > > more information, should we want to 'explain' the occurrence, given I
> > > see this every week or two and report back.
> > 
> > Seems reasonable to me.
> 
> I can implement the 'end_of_event_timeout' change either as
> i. a command line argument to ausearch/aureport (say --eoetmo secs) and a
> new pair of library functions within the  auparse() stable (say
> auparse_set_eoe_timeout() and auparse_get_eoe_timeout())
> or
> ii. a configuration item in /etc/audit/auditd.conf, or
> 
> 
> Which is your preference? Mine is i. as this is a user space processing
> change, not a demon change.

To be honest, I'm not entirely sure what we're seeing. I run some tests today 
on my system. It's seeing issues also. I'd still like to treat the root cause 
of this. But we do need to change the default. That I what I'm trying to 
figure out.

Back to your question, I'm wondering if we should do both? A changeable 
default in auditd.conf and an override on the command line.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

