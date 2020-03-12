Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 30B60183979
	for <lists+linux-audit@lfdr.de>; Thu, 12 Mar 2020 20:31:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584041481;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gFfHePftECQSTFIjBYmD3ZgA1TBgvWTTrNxF934pyaI=;
	b=TjT9xxp718RyXgMdUHi0ZnfClIQt1uvD9gDJ8o7yes9x1H1rQJIhJNIh+VOGMsaEM3Rc0a
	42w3CSwsLZm1rovG3M+BcIBN0ZNRshnlkgPeYR8JRSvumGCfkPq21YWlgCGco7CaXrfi5Y
	8U8wYEERwDhgN+VprAOuXDBE186pyZw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-UkFCaRjbOxClgU5o41wtBA-1; Thu, 12 Mar 2020 15:31:18 -0400
X-MC-Unique: UkFCaRjbOxClgU5o41wtBA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C375DBA6;
	Thu, 12 Mar 2020 19:31:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A43D9078A;
	Thu, 12 Mar 2020 19:31:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E15B185EC9;
	Thu, 12 Mar 2020 19:31:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02CJUnvD003576 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 12 Mar 2020 15:30:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A241519481; Thu, 12 Mar 2020 19:30:49 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-16.rdu2.redhat.com
	[10.10.112.16])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F40419C6A;
	Thu, 12 Mar 2020 19:30:39 +0000 (UTC)
Date: Thu, 12 Mar 2020 15:30:37 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak90 V8 07/16] audit: add contid support for signalling
	the audit daemon
Message-ID: <20200312193037.2tb5f53yeisfq4ta@madcap2.tricolour.ca>
References: <cover.1577736799.git.rgb@redhat.com>
	<20200204231454.oxa7pyvuxbj466fj@madcap2.tricolour.ca>
	<CAHC9VhQquokw+7UOU=G0SsD35UdgmfysVKCGCE87JVaoTkbisg@mail.gmail.com>
	<3142237.YMNxv0uec1@x2>
	<CAHC9VhTiCHQbp2SwK0Xb1QgpUZxOQ26JKKPsVGT0ZvMqx28oPQ@mail.gmail.com>
	<CAHC9VhS09b_fM19tn7pHZzxfyxcHnK+PJx80Z9Z1hn8-==4oLA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhS09b_fM19tn7pHZzxfyxcHnK+PJx80Z9Z1hn8-==4oLA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	linux-audit@redhat.com, netfilter-devel@vger.kernel.org,
	ebiederm@xmission.com, simo@redhat.com, netdev@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, mpatel@redhat.com,
	Serge Hallyn <serge@hallyn.com>
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
Content-Disposition: inline

On 2020-02-13 16:44, Paul Moore wrote:
> This is a bit of a thread-hijack, and for that I apologize, but
> another thought crossed my mind while thinking about this issue
> further ... Once we support multiple auditd instances, including the
> necessary record routing and duplication/multiple-sends (the host
> always sees *everything*), we will likely need to find a way to "trim"
> the audit container ID (ACID) lists we send in the records.  The
> auditd instance running on the host/initns will always see everything,
> so it will want the full container ACID list; however an auditd
> instance running inside a container really should only see the ACIDs
> of any child containers.

Agreed.  This should be easy to check and limit, preventing an auditd
from seeing any contid that is a parent of its own contid.

> For example, imagine a system where the host has containers 1 and 2,
> each running an auditd instance.  Inside container 1 there are
> containers A and B.  Inside container 2 there are containers Y and Z.
> If an audit event is generated in container Z, I would expect the
> host's auditd to see a ACID list of "1,Z" but container 1's auditd
> should only see an ACID list of "Z".  The auditd running in container
> 2 should not see the record at all (that will be relatively
> straightforward).  Does that make sense?  Do we have the record
> formats properly designed to handle this without too much problem (I'm
> not entirely sure we do)?

I completely agree and I believe we have record formats that are able to
handle this already.

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

