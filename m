Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id CDF3D1CA966
	for <lists+linux-audit@lfdr.de>; Fri,  8 May 2020 13:17:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588936671;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7EApbQEQ0lV3G38kk0pZMNKdvgvjmOEgJfUufzexmCE=;
	b=aU5KMrT4gyOlx3S3STndtQ7/Mkzjem+K4TyRYFp8QSr1e+2mFzGX6d/hpM2hZIyqbPXWpD
	M8BZ4aJJw7mJBEZl2Lcop4JHRTDJSPO28jhK+QG1f4TFon1KElpnjC4J4XCWgEFzlyFf/t
	fl7XDY6Ba+RJImoBvIQFlGBj3OMvcL8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-vW1_J1XvOw2jrCuZQxn7hg-1; Fri, 08 May 2020 07:17:48 -0400
X-MC-Unique: vW1_J1XvOw2jrCuZQxn7hg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5119872FEE;
	Fri,  8 May 2020 11:17:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 511212E045;
	Fri,  8 May 2020 11:17:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E368F1809543;
	Fri,  8 May 2020 11:17:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 048BHDAd008999 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 8 May 2020 07:17:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 554E962ABC; Fri,  8 May 2020 11:17:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.3.128.9])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B66526155F;
	Fri,  8 May 2020 11:17:03 +0000 (UTC)
Date: Fri, 8 May 2020 07:17:00 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH] audit: Replace zero-length array with flexible-array
Message-ID: <20200508111700.4uwa7oizxqakbk3t@madcap2.tricolour.ca>
References: <20200507185041.GA13930@embeddedor>
	<20200507215812.ksvwcykfged7ye2a@madcap2.tricolour.ca>
	<20200507224955.GA22343@embeddedor>
MIME-Version: 1.0
In-Reply-To: <20200507224955.GA22343@embeddedor>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-05-07 17:49, Gustavo A. R. Silva wrote:
> On Thu, May 07, 2020 at 05:58:13PM -0400, Richard Guy Briggs wrote:
> > On 2020-05-07 13:50, Gustavo A. R. Silva wrote:
> > > The current codebase makes use of the zero-length array language
> > > extension to the C90 standard, but the preferred mechanism to declare
> > > variable-length types such as these ones is a flexible array member[1][2],
> > > introduced in C99:
> > > 
> > > struct foo {
> > >         int stuff;
> > >         struct boo array[];
> > > };
> > > 
> > > By making use of the mechanism above, we will get a compiler warning
> > > in case the flexible array does not occur last in the structure, which
> > > will help us prevent some kind of undefined behavior bugs from being
> > > inadvertently introduced[3] to the codebase from now on.
> > > 
> > > Also, notice that, dynamic memory allocations won't be affected by
> > > this change:
> > > 
> > > "Flexible array members have incomplete type, and so the sizeof operator
> > > may not be applied. As a quirk of the original implementation of
> > > zero-length arrays, sizeof evaluates to zero."[1]
> > > 
> > > sizeof(flexible-array-member) triggers a warning because flexible array
> > > members have incomplete type[1]. There are some instances of code in
> > > which the sizeof operator is being incorrectly/erroneously applied to
> > > zero-length arrays and the result is zero. Such instances may be hiding
> > > some bugs. So, this work (flexible-array member conversions) will also
> > > help to get completely rid of those sorts of issues.
> > > 
> > > This issue was found with the help of Coccinelle.
> > > 
> > > [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> > > [2] https://github.com/KSPP/linux/issues/21
> > > [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
> > > 
> > > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> > 
> > Sounds reasonable to me.  There's another in include/uapi/linux/audit.h
> 
> Hi,

Hello Gustavo,

> I wouldn't advise to make any of these conversions in include/uapi/
> [1][2].

Ah-hah.  Thanks for the contra-indicating supporting references.

> > in struct audit_rule_data buf[0].  This alert also helped me fix another
> > one in a patchset I'm about to post (and will probably cause a merge
> > conflict but we can figure that out).
> 
> Awesome. :)
> 
> > Reviewed-by: Richard Guy Briggs <rgb@redhat.com>
> 
> Thanks
> --
> Gustavo
> 
> [1] https://lore.kernel.org/lkml/20200424121553.GE26002@ziepe.ca/
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1e6e9d0f4859ec698d55381ea26f4136eff3afe1
> 
> > > ---
> > >  include/linux/audit.h |    2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/include/linux/audit.h b/include/linux/audit.h
> > > index f9ceae57ca8d..2b63aee6e9fa 100644
> > > --- a/include/linux/audit.h
> > > +++ b/include/linux/audit.h
> > > @@ -19,7 +19,7 @@
> > >  struct audit_sig_info {
> > >  	uid_t		uid;
> > >  	pid_t		pid;
> > > -	char		ctx[0];
> > > +	char		ctx[];
> > >  };
> > >  
> > >  struct audit_buffer;
> > 
> > - RGB

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

