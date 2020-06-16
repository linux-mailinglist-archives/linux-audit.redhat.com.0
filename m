Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E9CB81FB628
	for <lists+linux-audit@lfdr.de>; Tue, 16 Jun 2020 17:29:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592321396;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qbIctReG/zEk/G4KXWduLuQRZGfZFPJNwKVDp1cQQKA=;
	b=Rjeu5F7dXLibVuV9+SyNnNp48PoumBgCwHS+gtYkQT1ftfzAFLN0CdFW39Aqc/sWjiSvpK
	MWL7oBMlUY/6QHPMbWmqRLtmcLp8HbQZMA4XOfff0qrnlmTrFmF0BtjdfXIF1Ehb+9DiKA
	SOlinXUsh3MoBX6BXtTCUnoxAUJlzk8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-klrb5UJPNDSNbP1EOlif6Q-1; Tue, 16 Jun 2020 11:29:54 -0400
X-MC-Unique: klrb5UJPNDSNbP1EOlif6Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A00E107B467;
	Tue, 16 Jun 2020 15:29:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2D205C1C3;
	Tue, 16 Jun 2020 15:29:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ED6A81809547;
	Tue, 16 Jun 2020 15:29:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05GFTPwf028804 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 16 Jun 2020 11:29:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1B4EA1001901; Tue, 16 Jun 2020 15:29:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-113-82.phx2.redhat.com [10.3.113.82])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5559110013D6;
	Tue, 16 Jun 2020 15:29:24 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH 1/2] integrity: Add errno field in audit message
Date: Tue, 16 Jun 2020 11:29:22 -0400
Message-ID: <6643272.rC52FQZPYE@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhT6JSLBD-JMfQbn9eUsUg=juznRz41DTOaia-=WhrAAuA@mail.gmail.com>
References: <20200611000400.3771-1-nramas@linux.microsoft.com>
	<8800031.dr63W5FlUW@x2>
	<CAHC9VhT6JSLBD-JMfQbn9eUsUg=juznRz41DTOaia-=WhrAAuA@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: rgb@redhat.com, linux-kernel@vger.kernel.org,
	Mimi Zohar <zohar@linux.ibm.com>,
	Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
	linux-audit@redhat.com, linux-integrity@vger.kernel.org
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Monday, June 15, 2020 6:58:13 PM EDT Paul Moore wrote:
> On Mon, Jun 15, 2020 at 6:23 PM Steve Grubb <sgrubb@redhat.com> wrote:
> > On Friday, June 12, 2020 3:50:14 PM EDT Lakshmi Ramasubramanian wrote:
> > > On 6/12/20 12:25 PM, Mimi Zohar wrote:
> > > > The idea is a good idea, but you're assuming that "result" is always
> > > > errno.  That was probably true originally, but isn't now.  For
> > > > example, ima_appraise_measurement() calls xattr_verify(), which
> > > > compares the security.ima hash with the calculated file hash.  On
> > > > failure, it returns the result of memcmp().  Each and every code path
> > > > will need to be checked.
> > > 
> > > Good catch Mimi.
> > > 
> > > Instead of "errno" should we just use "result" and log the value given
> > > in the result parameter?
> > 
> > That would likely collide with another field of the same name which is
> > the
> > operation's results. If it really is errno, the name is fine. It's
> > generic
> > enough that it can be reused on other events if that mattered.
> 
> Steve, what is the historical reason why we have both "res" and
> "result" for indicating a boolean success/fail?  I'm just curious how
> we ended up this way, and who may still be using "result".

I think its pam and some other user space things did this. But because of 
mixed machines in datacenters supporting multiple versions of OS, we have to 
leave result alone. It has to be 0,1 or success/fail. We cannot use it for 
errno.

-Steve


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

