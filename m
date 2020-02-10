Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 43F82158356
	for <lists+linux-audit@lfdr.de>; Mon, 10 Feb 2020 20:14:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581362044;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Q1vd5gwib6S2UnvvUeuxAMXB2NOCVXfHR42iZ0fyfpg=;
	b=bUKAJvK7TvI34fZBFWQy1/zC+BJcUjXUqxM9uQaWuIw20iXXWrjcHe/3kh3r7j829rbmol
	a4NC9+i2wuiw17YSw/IoX3IGurhQaXApFWr75lokrCzQtIxm+LlMeVBNHf/3Ra/mSp1AjN
	m0oqSLycBKMM7RbVIiiloMaej26MDcU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-zwvS7lJXMvWVOuQxxJSH_g-1; Mon, 10 Feb 2020 14:14:01 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDDC5184AEB4;
	Mon, 10 Feb 2020 19:13:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0463489F29;
	Mon, 10 Feb 2020 19:13:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6BB8A866CB;
	Mon, 10 Feb 2020 19:13:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01AJDTfF002483 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 10 Feb 2020 14:13:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B60055C10B; Mon, 10 Feb 2020 19:13:29 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-16.rdu2.redhat.com
	[10.10.112.16])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 415775C103;
	Mon, 10 Feb 2020 19:13:21 +0000 (UTC)
Date: Mon, 10 Feb 2020 14:13:18 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak25 v2 1/9] netfilter: normalize x_table function
	declarations
Message-ID: <20200210191318.yubldkszlh55wvdt@madcap2.tricolour.ca>
References: <cover.1577830902.git.rgb@redhat.com>
	<194bdc565d548a14e12357a7c1a594605b7fdf0f.1577830902.git.rgb@redhat.com>
	<CAHC9VhT9T-UMnu6bWdd733XB6QaP+Sm3KWhdy828RN_FVWBMmw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhT9T-UMnu6bWdd733XB6QaP+Sm3KWhdy828RN_FVWBMmw@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
Cc: fw@strlen.de, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	twoerner@redhat.com, Eric Paris <eparis@parisplace.org>,
	tgraf@infradead.org
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
X-MC-Unique: zwvS7lJXMvWVOuQxxJSH_g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-01-30 22:17, Paul Moore wrote:
> On Mon, Jan 6, 2020 at 1:54 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > Git context diffs were being produced with unhelpful declaration types
> > in the place of function names to help identify the funciton in which
>                                                       ^^^^^^^^
>                                                       function
> > changes were made.
> >
> > Normalize x_table function declarations so that git context diff
> > function labels work as expected.
> >
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> > ---
> >  net/netfilter/x_tables.c | 43 ++++++++++++++++++-------------------------
> >  1 file changed, 18 insertions(+), 25 deletions(-)
> 
> Considering that this patch is a style change in code outside of
> audit, and we want to merge this via the audit tree, I think it is
> best if you drop the style changes from this patchset.  You can always
> submit them later to the netfilter developers.

Fair enough.  They were intended to help make the audit patches cleaner
by giving proper function name context in the diff, but I'll address the
issues and re-submit via netfilter-devel.

> paul moore

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

