Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0F89057C
	for <lists+linux-audit@lfdr.de>; Fri, 16 Aug 2019 18:11:59 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8FF34C057E9F;
	Fri, 16 Aug 2019 16:11:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 206393AF3;
	Fri, 16 Aug 2019 16:11:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 547492551C;
	Fri, 16 Aug 2019 16:11:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7GF2OiU031813 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 16 Aug 2019 11:02:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5463217AB4; Fri, 16 Aug 2019 15:02:24 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC631183D8;
	Fri, 16 Aug 2019 15:02:17 +0000 (UTC)
Received: from UHIL19PA36.eemsg.mail.mil (UHIL19PA36.eemsg.mail.mil
	[214.24.21.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2FE4D30A5686;
	Fri, 16 Aug 2019 15:02:16 +0000 (UTC)
X-EEMSG-check-017: 14220264|UHIL19PA36_ESA_OUT02.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.64,393,1559520000"; d="scan'208";a="14220264"
Received: from emsm-gh1-uea11.ncsc.mil ([214.29.60.3])
	by UHIL19PA36.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256;
	16 Aug 2019 14:57:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
	s=tycho.nsa.gov; t=1565967433; x=1597503433;
	h=subject:to:cc:references:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=f9cJ1EV/ZEc9UZyyx/O5Ft2nbRY5eW+mwi7zmkGYiw0=;
	b=CJhz8sxWRX26pzvpqAb1vmLqAji/X+k9hanODc0WxMw4t1bKo/4E81Pl
	LeOv3zy+06da/J0PAnUFK3yfa0HC4KK1ANE5GQE0nhKE4KqVkTpFjHwg8
	e9AWVJb6n3emDRMCEd3GIyeBYCjk3Tc84OoG9wd+p9DbxhHSJ37AZGTpo
	qxlKPX4FIi1kTZnAp6XVUwzEDLRFfY7wMkkLU0+hb6/gkbYonTu1N7PFK
	WaTqtnZSLQlgO55vWCh92C1BBPYvkqS1bma3Sa15kVDEmC1sawBruA33n
	kDwrAeecP7LbD4NWXJccpOi3mTPm6wrQ9t8HsuLzwQtRILKele9hAwZJe A==;
X-IronPort-AV: E=Sophos;i="5.64,393,1559520000"; d="scan'208";a="31567925"
IronPort-PHdr: =?us-ascii?q?9a23=3AnOW3WhUDxjj5GRMGxiGK+8MIE6XV8LGtZVwlr6?=
	=?us-ascii?q?E/grcLSJyIuqrYZReBtKdThVPEFb/W9+hDw7KP9fy5AypZus3K7yBKWacPfi?=
	=?us-ascii?q?dNsd8RkQ0kDZzNImzAB9muURYHGt9fXkRu5XCxPBsdMs//Y1rPvi/6tmZKSV?=
	=?us-ascii?q?3wOgVvO+v6BJPZgdip2OCu4Z3TZBhDiCagbb9oIxi6sBvdutMLjYZsJKs9xR?=
	=?us-ascii?q?nEr3hVcOlK2G1kIk6ekQzh7cmq5p5j9CpQu/Ml98FeVKjxYro1Q79FAjk4Km?=
	=?us-ascii?q?45/MLkuwXNQguJ/XscT34ZkgFUDAjf7RH1RYn+vy3nvedgwiaaPMn2TbcpWT?=
	=?us-ascii?q?S+6qpgVRHlhDsbOzM/7WrakdJ7gr5Frx29phx/24/Ub5+TNPpiZaPWYNcWSX?=
	=?us-ascii?q?NcUspNSyBNB4WxYIUVD+oFIO1WsY/zqVUTphe6HAWhBOfixjpOi3Tr36M1zv?=
	=?us-ascii?q?4hHBnb0gI+EdIAsHfaotv7O6gdU++60KbGwC7fb/5Uwzrx9JTEfx4jrPyKQL?=
	=?us-ascii?q?l+cdDRyU4qFw7dk1uQtZLqPyuV1usTtWiQ8vduVee1hG4jrwF+vDiuzdorh4?=
	=?us-ascii?q?nSm40V0UvJ9Tl5wYkpJd24T1R3Ydi/EJRKrS2aOIx2Qt07TmxupS00yaUGtI?=
	=?us-ascii?q?amcCUFx5kr3R7SZ+Gdf4SW7R/vSvydLSp+iXl4YrywnQyy/lKlyuDkU8m010?=
	=?us-ascii?q?tFoTRdn9nXs3ANywTT6s+aSvth5kuh2SiA1wTU6uxcPUA7j7DbK588wr4rjJ?=
	=?us-ascii?q?YTrUTCETP2mEXxlqOWcFkr+vO05Oj9Z7Xmp5ucO5d1igH4LKsuhtSyDfk3Pw?=
	=?us-ascii?q?UBRWSW+fmw2Kf98UD2XrlGlOA6nrHcsJ/AJMQboqC5AxVS0oYm8xu/FCqp0M?=
	=?us-ascii?q?8DkHkbLFNKZBKHj4/zN1HIO/D3F+2zg1urkDd13/zGJKHuAo3RLnjfl7fsZb?=
	=?us-ascii?q?R960tbyAop19Bf5olUB6oHIP3pX0/+qt3YAgU+MwyuzObtEM992Z8GWWKTHq?=
	=?us-ascii?q?+ZN7vfsUeS6eIyJ+mBf5cVtyzgK/gh/vLuiHg5mVgHfaa3x5cYdHe4HvF+KU?=
	=?us-ascii?q?WDfXXsmssBEXsNvgcmVuzqh0aNXCVJZ3msQq085is0CJ68AYjfQYCthaSL3D?=
	=?us-ascii?q?2nEZ1OemBGFleMHG/td4WDQfcMdCWSIslkkjEfSbehS5Uh1RartA/71rpnK/?=
	=?us-ascii?q?DY+ioCtZLszNJ1/fHclQku9TxoCMSQy2ONT2Z0nmMOXTM23qd/oUxnxVeFyq?=
	=?us-ascii?q?h3nfpYGMdP6PxTVAc6Mpjcz+1mBN/oXgLNZMuGSFGjQt++GzE+Usoxw8MSY0?=
	=?us-ascii?q?Z6A9iilQ7M3y6rA78TiryKC4c58rzT33fvPcZx0XXG27c7j1kgXMRPMXeqhq?=
	=?us-ascii?q?ll9wjcH4TJiVmWl762daQA2y7A7GODzXeSvEFfSwN/S6DFUmoDaUTMtdT551?=
	=?us-ascii?q?/CQKWqCbg9NAtO19KCILNQatL1lVVGWOvjONPGbmK1mmewAwuIx7yVYIrxZW?=
	=?us-ascii?q?oSwDjdCFIFkwAP/XeKLA0+BiC8rGLDCDxhC0niY13j8eZgsnO3VEw0wB+Qb0?=
	=?us-ascii?q?1nybW1/gQZhfuGS/McxrgEojsuqy1oHFah2NLbE96ApwtnfKVBbtIx+U1I1X?=
	=?us-ascii?q?/EuAx8IpytNLpiiUADfAR3pUzuyw97BZlHkcgvtHkq1hZ9KbqE0FNdcDOVxY?=
	=?us-ascii?q?vwNaPNKmn94h+icK7W1Uva0NaS+qYP7u40pEnkvAGsRQIe9CBF2txYyDO54Y?=
	=?us-ascii?q?/QDRFaBZD0VVwt9gNSobjfbyh74JnbgzkkGKCutTmK9NUoCOYhgkKpdNhYMa?=
	=?us-ascii?q?+JPBPjGM0dQc61IaolnEb/PTweO+UHz7I5J8OrcbO93aevOOtx1Ga9gX9v/J?=
	=?us-ascii?q?F20kXK8TF1DOHPwcBWkLmjwgKbWmKk3x+aucftlNUBPGxDEw=3D=3D?=
X-IPAS-Result: =?us-ascii?q?A2AFAgCww1Zd/wHyM5BlHQEBBQEHBQGBVgUBCwGBbSqBP?=
	=?us-ascii?q?gEyhEmPWwEBAQEBAQaBNolqigSHHgkBAQEBAQEBAQE0AQIBAYQ/AoMaIzcGD?=
	=?us-ascii?q?gIFAQEBBAEBAQEBBgMBAWyFM4I6KQGCZwEFIxVBEAsOCgICJgICVwYBDAgBA?=
	=?us-ascii?q?YJfP4F3FKl5gTKFSIMsgUmBDCgBi2gXeIEHgREngms+h0+CWASUQl2WMQmCH?=
	=?us-ascii?q?4IhkgwGG5hCLY0qmhUigVgrCAIYCCEPgyiCeY4pIwOBNgEBjhoBAQ?=
Received: from tarius.tycho.ncsc.mil ([144.51.242.1])
	by emsm-gh1-uea11.NCSC.MIL with ESMTP; 16 Aug 2019 14:57:07 +0000
Received: from moss-pluto.infosec.tycho.ncsc.mil (moss-pluto [192.168.25.131])
	by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id
	x7GEv4UT030102; Fri, 16 Aug 2019 10:57:05 -0400
Subject: Re: [RFC PATCH v3] security, capability: pass object information to
	security_capable
To: James Morris <jmorris@namei.org>, Aaron Goidel <acgoide@tycho.nsa.gov>
References: <20190815202357.4238-1-acgoide@tycho.nsa.gov>
	<alpine.LRH.2.21.1908160817300.22623@namei.org>
From: Stephen Smalley <sds@tycho.nsa.gov>
Message-ID: <cebacde0-5c53-c414-8f27-8d81ed928dfd@tycho.nsa.gov>
Date: Fri, 16 Aug 2019 10:57:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.21.1908160817300.22623@namei.org>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Fri, 16 Aug 2019 15:02:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Fri, 16 Aug 2019 15:02:17 +0000 (UTC) for IP:'214.24.21.195'
	DOMAIN:'UHIL19PA36.eemsg.mail.mil'
	HELO:'UHIL19PA36.eemsg.mail.mil' FROM:'sds@tycho.nsa.gov' RCPT:''
X-RedHat-Spam-Score: -0.101  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, SPF_HELO_NONE,
	SPF_PASS) 214.24.21.195 UHIL19PA36.eemsg.mail.mil 214.24.21.195
	UHIL19PA36.eemsg.mail.mil <sds@tycho.nsa.gov>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 16 Aug 2019 12:11:42 -0400
Cc: mortonm@chromium.org, john.johansen@canonical.com, rgb@redhat.com,
	luto@amacapital.net, selinux@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	serge@hallyn.com, nhfran2@tycho.nsa.gov
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Fri, 16 Aug 2019 16:11:58 +0000 (UTC)

On 8/15/19 6:32 PM, James Morris wrote:
> On Thu, 15 Aug 2019, Aaron Goidel wrote:
> 
>> In SELinux this new information is leveraged here to perform an
>> additional inode based check for capabilities relevant to inodes. Since
>> the inode provided to capable_wrt_inode_uidgid() is a const argument,
>> this also required propagating const down to dump_common_audit_data() and
>> dropping the use of d_find_alias() to find an alias for the inode. This
>> was sketchy to begin with and should be obsoleted by a separate change
>> that will allow LSMs to trigger audit collection for all file-related
>> information.
> 
> Will the audit logs look the same once the 2nd patch is applied? We need
> to be careful about breaking existing userland.

It was already the case that the name= field in the AVC audit record was 
not guaranteed to be emitted in this case, since d_find_alias could 
return NULL.  And it was only a hint, since that name might have nothing 
to do with the name used to look up the inode in the first place. So I 
don't believe userland could have ever relied upon it being present 
here.  Removing it also fixes a problem with AVC audit generation under 
RCU walk; we should be able to drop the code that skips audit generation 
in that case with this d_find_alias call gone IIUC.

With the ability for an LSM to enable collection and generation of 
AUDIT_PATH and other AUDIT_* records (which is made possible via the 
other patch), we will get more complete and relevant information in the 
audit log.  It won't look exactly the same (there will be separate AVC, 
PATH, ... records that can be correlated based on timestamp/serial and 
ausearch does this automatically for you).

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
