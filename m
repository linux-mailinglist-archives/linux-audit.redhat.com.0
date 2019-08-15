Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 397008F7A2
	for <lists+linux-audit@lfdr.de>; Fri, 16 Aug 2019 01:36:38 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5FC823082138;
	Thu, 15 Aug 2019 23:36:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AA038CBBD;
	Thu, 15 Aug 2019 23:36:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E896E18005A0;
	Thu, 15 Aug 2019 23:36:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7FNaH4G025654 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 15 Aug 2019 19:36:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D493F5DA8B; Thu, 15 Aug 2019 23:36:17 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DE5C8CFA2;
	Thu, 15 Aug 2019 23:36:12 +0000 (UTC)
Received: from namei.org (namei.org [65.99.196.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0E93F8665A;
	Thu, 15 Aug 2019 23:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by namei.org (8.14.4/8.14.4) with ESMTP id x7FMWCnq026112;
	Thu, 15 Aug 2019 22:32:12 GMT
Date: Fri, 16 Aug 2019 08:32:12 +1000 (AEST)
From: James Morris <jmorris@namei.org>
To: Aaron Goidel <acgoide@tycho.nsa.gov>
Subject: Re: [RFC PATCH v3] security,capability: pass object information to
	security_capable
In-Reply-To: <20190815202357.4238-1-acgoide@tycho.nsa.gov>
Message-ID: <alpine.LRH.2.21.1908160817300.22623@namei.org>
References: <20190815202357.4238-1-acgoide@tycho.nsa.gov>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Delayed for 01:03:54 by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.26]); Thu, 15 Aug 2019 23:36:12 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Thu, 15 Aug 2019 23:36:12 +0000 (UTC) for IP:'65.99.196.166'
	DOMAIN:'namei.org' HELO:'namei.org' FROM:'jmorris@namei.org'
	RCPT:''
X-RedHat-Spam-Score: 0.002  (SPF_HELO_NONE,
	SPF_NONE) 65.99.196.166 namei.org 65.99.196.166 namei.org
	<jmorris@namei.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
Cc: mortonm@chromium.org, john.johansen@canonical.com, rgb@redhat.com,
	luto@amacapital.net, selinux@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	serge@hallyn.com, sds@tycho.nsa.gov, nhfran2@tycho.nsa.gov
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Thu, 15 Aug 2019 23:36:36 +0000 (UTC)

On Thu, 15 Aug 2019, Aaron Goidel wrote:

> In SELinux this new information is leveraged here to perform an
> additional inode based check for capabilities relevant to inodes. Since
> the inode provided to capable_wrt_inode_uidgid() is a const argument,
> this also required propagating const down to dump_common_audit_data() and
> dropping the use of d_find_alias() to find an alias for the inode. This
> was sketchy to begin with and should be obsoleted by a separate change
> that will allow LSMs to trigger audit collection for all file-related
> information.

Will the audit logs look the same once the 2nd patch is applied? We need 
to be careful about breaking existing userland.


-- 
James Morris
<jmorris@namei.org>

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
