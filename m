Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD8D8BD45
	for <lists+linux-audit@lfdr.de>; Tue, 13 Aug 2019 17:36:52 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B9AAD30FB8C3;
	Tue, 13 Aug 2019 15:36:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0DE7821FE;
	Tue, 13 Aug 2019 15:36:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6CE5C1800202;
	Tue, 13 Aug 2019 15:36:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7DF1Boe007569 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 13 Aug 2019 11:01:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EDE2282496; Tue, 13 Aug 2019 15:01:11 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E388737DE;
	Tue, 13 Aug 2019 15:01:11 +0000 (UTC)
Received: from UHIL19PA40.eemsg.mail.mil (UHIL19PA40.eemsg.mail.mil
	[214.24.21.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B196E30EA1AC;
	Tue, 13 Aug 2019 15:01:09 +0000 (UTC)
X-EEMSG-check-017: 12417255|UHIL19PA40_ESA_OUT06.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.64,381,1559520000"; d="scan'208";a="12417255"
Received: from emsm-gh1-uea10.ncsc.mil ([214.29.60.2])
	by UHIL19PA40.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256;
	13 Aug 2019 15:01:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
	s=tycho.nsa.gov; t=1565708468; x=1597244468;
	h=subject:to:cc:references:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=4Kq+OhLj2oJ++cAUj2DrTWydVR0qLAHhSrD3a3qV8T4=;
	b=pEEZIlodjeCmT9wbDYEbcIlBGFxDVW/evJCEFTwupc32S1FyFFZ7ayyT
	XzLPBtQA/CgG/sRWX7FUEZYL45n9+2QAI5PSndPQC9pWm/mVv7SRlmf1y
	LxJ1+eER6fouNv9RiFInxK0MSlF7dlRd0oPiXsIDzHncTCoeW0UFc53PV
	qAEW9T2Yksv5DV+hZO1PfnxDCzLtaCwNOlhGUtbftuBbaEEsZXId4nqji
	198tMVZCuseEcXsMOOOOf8eIdxOsbIQXbCQkqdtDFIDqkIanCcqa2/Waz
	g1OkeWmaIWg8BwW4vQTzQGbacseJKmj6bUUGxgBXw6YmYJOJuZGheqAuO w==;
X-IronPort-AV: E=Sophos;i="5.64,381,1559520000"; d="scan'208";a="26735244"
IronPort-PHdr: =?us-ascii?q?9a23=3ApiUc6xDJknoz9BGhMrL/UyQJP3N1i/DPJgcQr6?=
	=?us-ascii?q?AfoPdwSP3/ocywAkXT6L1XgUPTWs2DsrQY0rCQ6vq+EjNcqb+681k6OKRWUB?=
	=?us-ascii?q?EEjchE1ycBO+WiTXPBEfjxciYhF95DXlI2t1uyMExSBdqsLwaK+i764jEdAA?=
	=?us-ascii?q?jwOhRoLerpBIHSk9631+ev8JHPfglEnjWwba5sIBmssAndqMgbjYRgJ6s+1x?=
	=?us-ascii?q?DEvmZGd+NKyG1yOFmdhQz85sC+/J5i9yRfpfcs/NNeXKv5Yqo1U6VWACwpPG?=
	=?us-ascii?q?4p6sLrswLDTRaU6XsHTmoWiBtIDBPb4xz8Q5z8rzH1tut52CmdIM32UbU5Ui?=
	=?us-ascii?q?ms4qt3VBPljjoMOiUn+2/LlMN/kKNboAqgpxNhxY7UfJqVP+d6cq/EYN8WWX?=
	=?us-ascii?q?ZNUsNXWiNPGIO8a5YEAfQHM+hWsoLxo0ICoBu6CAWpAu7k1z1GiWLs3aAizu?=
	=?us-ascii?q?ovDw/G0gwjEdwAvnvbo9f6O7sdX+2u0KnFzy/OY+9K1Trz6oXFdA0qr/GWXb?=
	=?us-ascii?q?J3dMrc0VUiGBnfjlWXr4zuIjKb1uMMs2eG8eVgUf+khmk9pA5trTivwcYshZ?=
	=?us-ascii?q?TXiY8O1lDF9Tl2wIYyJdGiTk57esSrHIFftyGdKYt7W8UvSHxrtiYi0rAKpJ?=
	=?us-ascii?q?G2cScQxJkn2hLTceKLfoeW7h75SeqcJypzimh/d7KlnRmy9FCtyuj7Vsapzl?=
	=?us-ascii?q?lHtjFFktzQtnAV0BzT99SHRuN9/ki/3TaP0Bje6v1eLkAulKrbNoUhzqQslp?=
	=?us-ascii?q?sTrUvDHij2lF/wjKCKbUUr5vKk6+HmYrXivpOcNol0hR/iMqk2h8CyDus1Ph?=
	=?us-ascii?q?IOUmSG4+iwyrLu8VPjTLlXlvE2l7PWsJHeJcQVvK65BApV35455BmjADem19?=
	=?us-ascii?q?UYkmQZI19eZBKGj5TmO1HJIPziC/e/mE6jnC1kx/DBIL3tGo/NIWTbkLf9Yb?=
	=?us-ascii?q?Z97FZRyBIpwtBC45JZEakBL+juWk/1rdDYCxg5Mwuuw+n5EtlyyoQeWWeXCK?=
	=?us-ascii?q?+DLKzSqUOI5v4oI+SUf48apjL9K/kj5/7zgn40gkEdfaa30psNcny4HeppI1?=
	=?us-ascii?q?+fYXXyhtcNC2AKvhAxTObykl2NTSZTZ2quX6I7/jw7DIOmDYHeRoGimbCBxz?=
	=?us-ascii?q?m0EYFLZmBcC1CMDXfpe5yBW/cLdS2SP8thnSIfWLi/RI8uywuuuBX5y7V5NO?=
	=?us-ascii?q?rU/DMXtZb52Nhy/e3Tmgk49SZoAMSFz2GNU2Z0k3sMRz8rwKB/pldwxU2G0a?=
	=?us-ascii?q?din/NXD8RT5/JVUgggMZ7Q1ep6BM7uWgjZZNeGVE6mQsm6ATE2Vt8xwdoOY0?=
	=?us-ascii?q?FnG9W4jxDDxDGnA7kPmLyOGpM087jQ33/rJ8Zy03zGzrUuj0E6QstTMm2rnq?=
	=?us-ascii?q?1/+BbNCI7Sj0qZkKGqdacH0SHR9GeD122OvERZUA5tVKXJR3cfZlHZrd7h/E?=
	=?us-ascii?q?PNU6euCag7MgtG0cOCMbVFasfmjVpYX/rjOM7RY2a1m2awAxaE3K+DbI3ve2?=
	=?us-ascii?q?8FxiXSFFAEkxwP/XaBLQU+BCCho2LYDDB0F1LvZEPs/vN4qHOgUEA0yRqHYF?=
	=?us-ascii?q?F72Lqz/R4Vg/2cRO8J0bIAoisutzJ0HFOl1dLMF9WAvxZhfLlbYd4l/FhIz3?=
	=?us-ascii?q?nZuBJ9P5G7NKBtml4efB5qv0Pg0xV4FJ9AndE2o3ww1gZ9NaWY0FZZfTOCwZ?=
	=?us-ascii?q?/wIqHXKnX1/B23bq7W3Uve0MqR+qcJ7fQ1sEnsvAGzFkol9nVn0sRV036G6p?=
	=?us-ascii?q?XNFgoSXor7Ulwr+Bhiu7Hafi496pvO1X1jKqa5qSXC1Mw0C+sl0BmgY81TP7?=
	=?us-ascii?q?+DFA/3C8caHdShKPQ2m1i1aRIJJORS9K8yP8O7ePqKwbSkPPt9kzKnkWRK+5?=
	=?us-ascii?q?p93VyR+Cp8UOHIw4wJzO2f3guCBH/AiwKZu93z0aVDYisfVj6nwDXgLJZYe6?=
	=?us-ascii?q?k3eIEME2roKMqykIZQnZnoDldR7lmlT3wB2cOkfVLGZlfy2gxc2GwLsHennm?=
	=?us-ascii?q?2+1DUynDY3+PnMlBfSyvjvIUJUclVAQ3Nv2BK1fNm5?=
X-IPAS-Result: =?us-ascii?q?A2DADgDZz1Jd/wHyM5BmHQEBBQEHBQGBZ4FuKoE/MiqEH?=
	=?us-ascii?q?o8lTQEBAQEBAQaBCS2JaooDhTeBZwkBAQEBAQEBAQE0AQIBAYQ/AoJ7IzgTA?=
	=?us-ascii?q?QQBAQEEAQEDAQkBAWyFM4I6KQGCZgEBAQEDIwQRQRALFQMCAhEOBwICVwYNB?=
	=?us-ascii?q?gIBAYJfP4F3FK0PfzOFSYMmgUmBDCiLaRd4gQeBOIFWYDU+g38lAQFdgkyCW?=
	=?us-ascii?q?ASVHJVBbQmCH4tfiE0GG4Iwhy+OXi2nOiGBWCsIAhgIIQ87gmyCThcVjikjA?=
	=?us-ascii?q?zCBBgEBjBmCQwEB?=
Received: from tarius.tycho.ncsc.mil ([144.51.242.1])
	by EMSM-GH1-UEA10.NCSC.MIL with ESMTP; 13 Aug 2019 15:01:07 +0000
Received: from moss-callisto.infosec.tycho.ncsc.mil (moss-callisto
	[192.168.25.136])
	by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id x7DF11qV005698; 
	Tue, 13 Aug 2019 11:01:01 -0400
Subject: Re: [Non-DoD Source] Re: [RFC PATCH v2] security, capability: pass
	object information to security_capable
To: Paul Moore <paul@paul-moore.com>
References: <20190801144313.1014-1-acgoide@tycho.nsa.gov>
	<CAHC9VhTSWiz45vh+M+sgu+ePwgFPZ4Mr8GmRZQjsGWQSzkjbLg@mail.gmail.com>
From: Aaron Goidel <acgoide@tycho.nsa.gov>
Message-ID: <b79617aa-2b40-40bf-9f35-0f5be8e34d3f@tycho.nsa.gov>
Date: Tue, 13 Aug 2019 11:01:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAHC9VhTSWiz45vh+M+sgu+ePwgFPZ4Mr8GmRZQjsGWQSzkjbLg@mail.gmail.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Tue, 13 Aug 2019 15:01:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Tue, 13 Aug 2019 15:01:10 +0000 (UTC) for IP:'214.24.21.199'
	DOMAIN:'UHIL19PA40.eemsg.mail.mil'
	HELO:'UHIL19PA40.eemsg.mail.mil' FROM:'acgoide@tycho.nsa.gov'
	RCPT:''
X-RedHat-Spam-Score: -0.101  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, SPF_HELO_NONE,
	SPF_PASS) 214.24.21.199 UHIL19PA40.eemsg.mail.mil 214.24.21.199
	UHIL19PA40.eemsg.mail.mil <acgoide@tycho.nsa.gov>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 13 Aug 2019 11:36:31 -0400
Cc: mortonm@chromium.org, john.johansen@canonical.com, selinux@vger.kernel.org,
	James Morris <jmorris@namei.org>, luto@amacapital.net,
	rgb@redhat.com, linux-security-module@vger.kernel.org,
	linux-audit@redhat.com, Nicholas Franck <nhfran2@tycho.nsa.gov>,
	Stephen Smalley <sds@tycho.nsa.gov>, Serge Hallyn <serge@hallyn.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Tue, 13 Aug 2019 15:36:51 +0000 (UTC)

On 8/8/19 12:30 PM, Paul Moore wrote:
> On Thu, Aug 1, 2019 at 10:43 AM Aaron Goidel <acgoide@tycho.nsa.gov> wrote:
>> From: Nicholas Franck <nhfran2@tycho.nsa.gov>
>>
>> At present security_capable does not pass any object information
>> and therefore can neither audit the particular object nor take it
>> into account. Augment the security_capable interface to support
>> passing supplementary data. Use this facility initially to convey
>> the inode for capability checks relevant to inodes. This only
>> addresses capable_wrt_inode_uidgid calls; other capability checks
>> relevant to inodes will be addressed in subsequent changes. In the
>> future, this will be further extended to pass object information for
>> other capability checks such as the target task for CAP_KILL.
>>
>> In SELinux this new information is leveraged here to include the inode
>> in the audit message. In the future, it could also be used to perform
>> a per inode capability checks.
>>
>> It would be possible to fold the existing opts argument into this new
>> supplementary data structure. This was omitted from this change to
>> minimize changes.
>>
>> Signed-off-by: Nicholas Franck <nhfran2@tycho.nsa.gov>
>> Signed-off-by: Aaron Goidel <acgoide@tycho.nsa.gov>
>> ---
>> v2:
>> - Changed order of audit prints so optional information comes second
>> ---
>>   include/linux/capability.h             |  7 ++++++
>>   include/linux/lsm_audit.h              |  5 +++-
>>   include/linux/lsm_hooks.h              |  3 ++-
>>   include/linux/security.h               | 23 +++++++++++++-----
>>   kernel/capability.c                    | 33 ++++++++++++++++++--------
>>   kernel/seccomp.c                       |  2 +-
>>   security/apparmor/capability.c         |  8 ++++---
>>   security/apparmor/include/capability.h |  4 +++-
>>   security/apparmor/ipc.c                |  2 +-
>>   security/apparmor/lsm.c                |  5 ++--
>>   security/apparmor/resource.c           |  2 +-
>>   security/commoncap.c                   | 11 +++++----
>>   security/lsm_audit.c                   | 21 ++++++++++++++--
>>   security/safesetid/lsm.c               |  3 ++-
>>   security/security.c                    |  5 ++--
>>   security/selinux/hooks.c               | 20 +++++++++-------
>>   security/smack/smack_access.c          |  2 +-
>>   17 files changed, 110 insertions(+), 46 deletions(-)
> 
> You should CC the linux-audit list, I've added them on this mail.
> 
> I had hoped to see some thought put into the idea of dynamically
> emitting the proper audit records as I mentioned in the previous patch
> set, but regardless there are some comments on this code as written
> ...
> 
>> diff --git a/security/lsm_audit.c b/security/lsm_audit.c
>> index 33028c098ef3..18cc7c956b69 100644
>> --- a/security/lsm_audit.c
>> +++ b/security/lsm_audit.c
>> @@ -229,9 +229,26 @@ static void dump_common_audit_data(struct audit_buffer *ab,
>>          case LSM_AUDIT_DATA_IPC:
>>                  audit_log_format(ab, " key=%d ", a->u.ipc_id);
>>                  break;
>> -       case LSM_AUDIT_DATA_CAP:
>> -               audit_log_format(ab, " capability=%d ", a->u.cap);
>> +       case LSM_AUDIT_DATA_CAP: {
>> +               const struct inode *inode;
>> +
>> +               audit_log_format(ab, " capability=%d ", a->u.cap_struct.cap);
>> +               if (a->u.cap_struct.cad) {
>> +                       switch (a->u.cap_struct.cad->type) {
>> +                       case CAP_AUX_DATA_INODE: {
>> +                               inode = a->u.cap_struct.cad->u.inode;
>> +
>> +                               audit_log_format(ab, " dev=");
>> +                               audit_log_untrustedstring(ab,
>> +                                       inode->i_sb->s_id);
>> +                               audit_log_format(ab, " ino=%lu",
>> +                                       inode->i_ino);
>> +                               break;
>> +                       }
> 
> Since you are declaring "inode" further up, there doesn't appear to be
> any need for the CAP_AUX_DATA_INODE braces, please remove them.
> 
> The general recommended practice when it comes to "sometimes" fields
> in an audit record, is to always record them in the record, but use a
> value of "?" when there is nothing relevant to record.  For example,
> when *not* recording inode information you would do something like the
> following:
> 
>    audit_log_format(ab, " dev=? ino=?");
> 
The issue this brings up is what happens when this is expanded to more 
cases? Assuming there will be a case here for logging audit data for 
task based capabilities (CAP_AUX_DATA_TASK), what do we want to have 
happen if we are recording *neither* inode information nor task 
information (say a PID)? If we log something in the inode case, we 
presumably don't want to call audit_log_format(ab, " dev=?, pid=?") as 
well. (And vice versa for when we log a pid and no inode).
>> +                       }
>> +               }
>>                  break;
>> +       }
>>          case LSM_AUDIT_DATA_PATH: {
>>                  struct inode *inode;
>>
> 

-- 
Aaron

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
