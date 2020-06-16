Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id ECAC61FB858
	for <lists+linux-audit@lfdr.de>; Tue, 16 Jun 2020 17:56:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592322969;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KV7z6sf4lhUdmBO3wX9z97NMqV5d55UD59xg0mKdtjI=;
	b=ZfktKbfuuG3xLKcczR6LXpZAd/c7ZLoJbprcfuTRtETVxESnATkme8aJlauqee1e+IlZbw
	oLVbV+yQufX5YX24f+f94BdzlesbXODBAPL7m1skt5+14ugx2CtizSjU+ZHfWP/1wLx9Sg
	R/qUgsdw3uzTh8FF1rGO4Y6cEzx7lD4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-jxlW78g4O-iXijWgZP6jpg-1; Tue, 16 Jun 2020 11:56:04 -0400
X-MC-Unique: jxlW78g4O-iXijWgZP6jpg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95C42E92C;
	Tue, 16 Jun 2020 15:55:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 290315C1BD;
	Tue, 16 Jun 2020 15:55:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CFE59833C6;
	Tue, 16 Jun 2020 15:55:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05GFtofJ001126 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 16 Jun 2020 11:55:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D182060C47; Tue, 16 Jun 2020 15:55:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-113-82.phx2.redhat.com [10.3.113.82])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 845DE60C05;
	Tue, 16 Jun 2020 15:55:44 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Subject: Re: [PATCH 1/2] integrity: Add errno field in audit message
Date: Tue, 16 Jun 2020 11:55:42 -0400
Message-ID: <1717101.NiBDiG0Zly@x2>
Organization: Red Hat
In-Reply-To: <958966b6-9972-051f-a7d5-cd6d1beb3244@linux.microsoft.com>
References: <20200611000400.3771-1-nramas@linux.microsoft.com>
	<6643272.rC52FQZPYE@x2>
	<958966b6-9972-051f-a7d5-cd6d1beb3244@linux.microsoft.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: rgb@redhat.com, linux-kernel@vger.kernel.org,
	Mimi Zohar <zohar@linux.ibm.com>, linux-audit@redhat.com,
	linux-integrity@vger.kernel.org
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tuesday, June 16, 2020 11:43:31 AM EDT Lakshmi Ramasubramanian wrote:
> On 6/16/20 8:29 AM, Steve Grubb wrote:
> >>>>> The idea is a good idea, but you're assuming that "result" is always
> >>>>> errno.  That was probably true originally, but isn't now.  For
> >>>>> example, ima_appraise_measurement() calls xattr_verify(), which
> >>>>> compares the security.ima hash with the calculated file hash.  On
> >>>>> failure, it returns the result of memcmp().  Each and every code path
> >>>>> will need to be checked.
> >>>> 
> >>>> Good catch Mimi.
> >>>> 
> >>>> Instead of "errno" should we just use "result" and log the value given
> >>>> in the result parameter?
> >>> 
> >>> That would likely collide with another field of the same name which is
> >>> the
> >>> operation's results. If it really is errno, the name is fine. It's
> >>> generic
> >>> enough that it can be reused on other events if that mattered.
> >> 
> >> Steve, what is the historical reason why we have both "res" and
> >> "result" for indicating a boolean success/fail?  I'm just curious how
> >> we ended up this way, and who may still be using "result".
> > 
> > I think its pam and some other user space things did this. But because of
> > mixed machines in datacenters supporting multiple versions of OS, we have
> > to leave result alone. It has to be 0,1 or success/fail. We cannot use
> > it for errno.
> 
> As Mimi had pointed out, since the value passed in result parameter is
> not always an error code, "errno" is not an appropriate name.
> 
> Can we add a new field, say, "op_result" to report the result of the
> specified operation?

Sure. But since it is errno sometimes, how would we know when to translate 
it?

-Steve



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

