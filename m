Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 564EF1FC003
	for <lists+linux-audit@lfdr.de>; Tue, 16 Jun 2020 22:29:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592339375;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=m01QSbXStwmlD2x4QhLeozcJyOtOAKfX92cUaEe0EsU=;
	b=f76Nmezg8f44o6frPP60dYPpaI7hoO4Ga5TaLvgitCMgPNBQenyui5FXCTBs7uYbOCVBkV
	1EsnIUIx0DFTsncOvqFyhW0wXbYW9kDDwGj0pKaCceBd1x6FrwdQOqarf4JAUe6DtH9CRQ
	SoHCFZPIt1SMp1IZZbXTkexA++bR0HY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-twJK3HsWNQq2U5xaLB7KWw-1; Tue, 16 Jun 2020 16:29:32 -0400
X-MC-Unique: twJK3HsWNQq2U5xaLB7KWw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D422F80F5CE;
	Tue, 16 Jun 2020 20:29:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 259ED1C8;
	Tue, 16 Jun 2020 20:29:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 73FA1833C8;
	Tue, 16 Jun 2020 20:29:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05GKSqBI032703 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 16 Jun 2020 16:28:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F07136C1A1; Tue, 16 Jun 2020 20:28:52 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-113-201.phx2.redhat.com [10.3.113.201])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 06D8D6C1A0;
	Tue, 16 Jun 2020 20:28:51 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH 1/2] integrity: Add errno field in audit message
Date: Tue, 16 Jun 2020 16:28:47 -0400
Message-ID: <2644117.Ritcz3IfYv@x2>
Organization: Red Hat
In-Reply-To: <1592337220.11061.239.camel@linux.ibm.com>
References: <20200611000400.3771-1-nramas@linux.microsoft.com>
	<1717101.NiBDiG0Zly@x2> <1592337220.11061.239.camel@linux.ibm.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
Cc: rgb@redhat.com, linux-kernel@vger.kernel.org,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tuesday, June 16, 2020 3:53:40 PM EDT Mimi Zohar wrote:
> On Tue, 2020-06-16 at 11:55 -0400, Steve Grubb wrote:
> > On Tuesday, June 16, 2020 11:43:31 AM EDT Lakshmi Ramasubramanian wrote:
> > > On 6/16/20 8:29 AM, Steve Grubb wrote:
> > > >>>>> The idea is a good idea, but you're assuming that "result" is
> > > >>>>> always errno.  That was probably true originally, but isn't now. 
> > > >>>>> For example, ima_appraise_measurement() calls xattr_verify(),
> > > >>>>> which compares the security.ima hash with the calculated file
> > > >>>>> hash.  On failure, it returns the result of memcmp().  Each and
> > > >>>>> every code path will need to be checked.
> > > >>>> 
> > > >>>> Good catch Mimi.
> > > >>>> 
> > > >>>> Instead of "errno" should we just use "result" and log the value
> > > >>>> given in the result parameter?
> > > >>> 
> > > >>> That would likely collide with another field of the same name which
> > > >>> is the operation's results. If it really is errno, the name is fine.
> > > >>> It's generic enough that it can be reused on other events if that
> > > >>> mattered.
> > > >> 
> > > >> Steve, what is the historical reason why we have both "res" and
> > > >> "result" for indicating a boolean success/fail?  I'm just curious
> > > >> how we ended up this way, and who may still be using "result".
> > > > 
> > > > I think its pam and some other user space things did this. But
> > > > because of mixed machines in datacenters supporting multiple versions
> > > > of OS, we have to leave result alone. It has to be 0,1 or success/
> > > > fail. We cannot use it for errno.
> > > 
> > > As Mimi had pointed out, since the value passed in result parameter is
> > > not always an error code, "errno" is not an appropriate name.
> > > 
> > > Can we add a new field, say, "op_result" to report the result of the
> > > specified operation?
> > 
> > Sure. But since it is errno sometimes, how would we know when to
> > translate it?
> 
> Perhaps the solution is not to imply "res" is "errno", but pass it as
> a separate "errno" field.

That's what is done on syscalls. There is success and exit where they both 
have different meaning sometimes but otherwise they agree.

> Then only include "errno" in the audit message when it isn't zero.  This
> assumes that some audit messages for the same audit number include errno,
> while others do not.

We normally do not like to have fields that swing in and out because then its 
hard to know exactly what's in the event. When an event has different fields 
under special conditions, then we just say call it a new event. Split it into 
2 or 3 instead forcing it all into 1. And we also do not like fields that 
change meaning. Because then intepretation becomes hard. Or other people 
wishing to record the same info in another event have to follow the same 
pattern.

So, if you really need this field, the give some name like err_code or errno 
or anything not taken. And just fill it out every time. Its OK to be 0. If 
this only happens under some special operation, then make it a new event and 
fill it out only for that operation/event.

Best Regards,
-Steve


> With this solution, the existing integrity_audit_msg() could become a
> wrapper for the new function.
> 
> Mimi




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

