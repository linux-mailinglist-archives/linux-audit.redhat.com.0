Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B792A1CAA5C
	for <lists+linux-audit@lfdr.de>; Fri,  8 May 2020 14:12:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588939953;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dvDwD9o46IQZAj7Uq/OGSjy6ffwLcrj1GS4c+hEP/uI=;
	b=bkabM8B7M9ZbwGRUpv6QBrBl9ncpL2bKzhZhFYA43ENg3Gp9XXc5wEVmI/Xpsio0rgTwVN
	2fEXhVT8hyYAhegfGpyGMFBBx7kHoyiyjAB7V9lzNLhcxkrAToS0Lo3aIMkTlJ1/qGa19W
	eNhUtC8F4vvc83/dNu8nrQZLrJYftfQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-SApKE70BPzqsoCwbLv7nWQ-1; Fri, 08 May 2020 08:12:31 -0400
X-MC-Unique: SApKE70BPzqsoCwbLv7nWQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B689480B71A;
	Fri,  8 May 2020 12:12:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2838C5D9CC;
	Fri,  8 May 2020 12:12:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C8B3B1809543;
	Fri,  8 May 2020 12:12:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 047Mjc6a030396 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 7 May 2020 18:45:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 973AE1182F1; Thu,  7 May 2020 22:45:38 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93010115158
	for <linux-audit@redhat.com>; Thu,  7 May 2020 22:45:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3412A80CDAF
	for <linux-audit@redhat.com>; Thu,  7 May 2020 22:45:36 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-313-EJ9HUvUmMjyiP81pDH4F3Q-1;
	Thu, 07 May 2020 18:45:30 -0400
X-MC-Unique: EJ9HUvUmMjyiP81pDH4F3Q-1
Received: from embeddedor (unknown [189.207.59.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id C274220725;
	Thu,  7 May 2020 22:45:28 +0000 (UTC)
Date: Thu, 7 May 2020 17:49:55 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH] audit: Replace zero-length array with flexible-array
Message-ID: <20200507224955.GA22343@embeddedor>
References: <20200507185041.GA13930@embeddedor>
	<20200507215812.ksvwcykfged7ye2a@madcap2.tricolour.ca>
MIME-Version: 1.0
In-Reply-To: <20200507215812.ksvwcykfged7ye2a@madcap2.tricolour.ca>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 047Mjc6a030396
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 08 May 2020 08:12:11 -0400
Cc: linux-audit@redhat.com, linux-kernel@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, May 07, 2020 at 05:58:13PM -0400, Richard Guy Briggs wrote:
> On 2020-05-07 13:50, Gustavo A. R. Silva wrote:
> > The current codebase makes use of the zero-length array language
> > extension to the C90 standard, but the preferred mechanism to declare
> > variable-length types such as these ones is a flexible array member[1][2],
> > introduced in C99:
> > 
> > struct foo {
> >         int stuff;
> >         struct boo array[];
> > };
> > 
> > By making use of the mechanism above, we will get a compiler warning
> > in case the flexible array does not occur last in the structure, which
> > will help us prevent some kind of undefined behavior bugs from being
> > inadvertently introduced[3] to the codebase from now on.
> > 
> > Also, notice that, dynamic memory allocations won't be affected by
> > this change:
> > 
> > "Flexible array members have incomplete type, and so the sizeof operator
> > may not be applied. As a quirk of the original implementation of
> > zero-length arrays, sizeof evaluates to zero."[1]
> > 
> > sizeof(flexible-array-member) triggers a warning because flexible array
> > members have incomplete type[1]. There are some instances of code in
> > which the sizeof operator is being incorrectly/erroneously applied to
> > zero-length arrays and the result is zero. Such instances may be hiding
> > some bugs. So, this work (flexible-array member conversions) will also
> > help to get completely rid of those sorts of issues.
> > 
> > This issue was found with the help of Coccinelle.
> > 
> > [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> > [2] https://github.com/KSPP/linux/issues/21
> > [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
> > 
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> 
> Sounds reasonable to me.  There's another in include/uapi/linux/audit.h

Hi,

I wouldn't advise to make any of these conversions in include/uapi/
[1][2].

> in struct audit_rule_data buf[0].  This alert also helped me fix another
> one in a patchset I'm about to post (and will probably cause a merge
> conflict but we can figure that out).

Awesome. :)

> 
> Reviewed-by: Richard Guy Briggs <rgb@redhat.com>
>

Thanks
--
Gustavo

[1] https://lore.kernel.org/lkml/20200424121553.GE26002@ziepe.ca/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1e6e9d0f4859ec698d55381ea26f4136eff3afe1

> > ---
> >  include/linux/audit.h |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/include/linux/audit.h b/include/linux/audit.h
> > index f9ceae57ca8d..2b63aee6e9fa 100644
> > --- a/include/linux/audit.h
> > +++ b/include/linux/audit.h
> > @@ -19,7 +19,7 @@
> >  struct audit_sig_info {
> >  	uid_t		uid;
> >  	pid_t		pid;
> > -	char		ctx[0];
> > +	char		ctx[];
> >  };
> >  
> >  struct audit_buffer;
> > 
> > 
> > --
> > Linux-audit mailing list
> > Linux-audit@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-audit
> 
> - RGB
> 
> --
> Richard Guy Briggs <rgb@redhat.com>
> Sr. S/W Engineer, Kernel Security, Base Operating Systems
> Remote, Ottawa, Red Hat Canada
> IRC: rgb, SunRaycer
> Voice: +1.647.777.2635, Internal: (81) 32635
> 


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

