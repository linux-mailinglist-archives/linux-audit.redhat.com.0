Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8E86D31EA68
	for <lists+linux-audit@lfdr.de>; Thu, 18 Feb 2021 14:29:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613654968;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=M4AF8gyTZodPRUcsY6nYBnNGhbPaXbzGAyg0FDcWUew=;
	b=KIOPKQR8TVN8AT4SKWWzE5wP6BZDX5enjju/t/02LoSjcImO3URwf6qoEc0CwjVym8Lsq+
	78S8tjV1McMUmSPyCk/bQM1g44stkPNNtCH9e8ptBE8eFlLOAldetukVYJzYcH4Y8Vv3bo
	hajKD34aacfADTnjghUSRHS1jOVMI9Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-CYW7BAe5NFSkfWu7ZbYVLw-1; Thu, 18 Feb 2021 08:29:26 -0500
X-MC-Unique: CYW7BAe5NFSkfWu7ZbYVLw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DC1791294;
	Thu, 18 Feb 2021 13:29:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B31D85D9C2;
	Thu, 18 Feb 2021 13:29:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 18E3F18095CB;
	Thu, 18 Feb 2021 13:29:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11IDSrd4021725 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 18 Feb 2021 08:28:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 94FCD614F0; Thu, 18 Feb 2021 13:28:53 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.8])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC66C60917;
	Thu, 18 Feb 2021 13:28:45 +0000 (UTC)
Date: Thu, 18 Feb 2021 08:28:43 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Florian Westphal <fw@strlen.de>
Subject: Re: [PATCH ghak124 v3] audit: log nftables configuration change events
Message-ID: <20210218132843.GP3141668@madcap2.tricolour.ca>
References: <f9da8b5dbf2396b621c77c17b5b1123be5aa484e.1591275439.git.rgb@redhat.com>
	<20210211151606.GX3158@orbyte.nwl.cc>
	<CAHC9VhTNQW9d=8GCW-70vAEMh8-LXviP+JHFC2-YkuitokLLMQ@mail.gmail.com>
	<20210211202628.GP2015948@madcap2.tricolour.ca>
	<20210211220930.GC2766@breakpoint.cc>
	<20210217234131.GN3141668@madcap2.tricolour.ca>
	<20210218082207.GJ2766@breakpoint.cc>
	<20210218124211.GO3141668@madcap2.tricolour.ca>
	<20210218125248.GB22944@breakpoint.cc>
MIME-Version: 1.0
In-Reply-To: <20210218125248.GB22944@breakpoint.cc>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
Cc: Phil Sutter <phil@nwl.cc>, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, twoerner@redhat.com,
	Eric Paris <eparis@parisplace.org>, tgraf@infradead.org
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2021-02-18 13:52, Florian Westphal wrote:
> Richard Guy Briggs <rgb@redhat.com> wrote:
> > On 2021-02-18 09:22, Florian Westphal wrote:
> > > No.  There is a hierarchy, e.g. you can't add a chain without first
> > > adding a table, BUT in case the table was already created by an earlier
> > > transaction it can also be stand-alone.
> > 
> > Ok, so there could be a stand-alone chain mod with one table, then a
> > table add of a different one with a "higher ranking" op...
> 
> Yes, that can happen.

Ok, can I get one more clarification on this "hierarchy"?  Is it roughly
in the order they appear in nf_tables_commit() after step 3?  It appears
it might be mostly already.  If it isn't already, would it be reasonable
to re-order them?  Would you suggest a different order?

(snip GET bits, that's now clear, thank you)

> > such that it would be desirable to filter them out
> > to reduce noise in that single log line if it is attempted to list all
> > the change ops?  It almost sounds like it would be better to do one
> > audit log line for each table for each family, and possibly for each op
> > to avoid the need to change userspace.  This would already be a
> > significant improvement picking the highest ranking op.
> 
> I think i understand what you'd like to do.  Yes, that would reduce
> the log output a lot.

Would the generation change id be useful outside the kernel?  What
exactly does it look like?  I don't quite understand the genmask purpose.

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
https://listman.redhat.com/mailman/listinfo/linux-audit

