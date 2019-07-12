Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C936675A6
	for <lists+linux-audit@lfdr.de>; Fri, 12 Jul 2019 22:03:34 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EA2CE30832E6;
	Fri, 12 Jul 2019 20:03:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E2CB5DE62;
	Fri, 12 Jul 2019 20:03:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 19BB941F40;
	Fri, 12 Jul 2019 20:03:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6CI2tPV008362 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 12 Jul 2019 14:02:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F416F1001281; Fri, 12 Jul 2019 18:02:54 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE8351001B23
	for <linux-audit@redhat.com>; Fri, 12 Jul 2019 18:02:52 +0000 (UTC)
Received: from ucol19pa14.eemsg.mail.mil (ucol19pa14.eemsg.mail.mil
	[214.24.24.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D561B3098558
	for <linux-audit@redhat.com>; Fri, 12 Jul 2019 18:02:51 +0000 (UTC)
X-EEMSG-check-017: 724502465|UCOL19PA14_EEMSG_MP12.csd.disa.mil
X-IronPort-AV: E=Sophos;i="5.63,483,1557187200"; d="scan'208";a="724502465"
Received: from emsm-gh1-uea11.ncsc.mil ([214.29.60.3])
	by ucol19pa14.eemsg.mail.mil with ESMTP/TLS/DHE-RSA-AES256-SHA256;
	12 Jul 2019 18:02:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=tycho.nsa.gov; i=@tycho.nsa.gov; q=dns/txt;
	s=tycho.nsa.gov; t=1562954540; x=1594490540;
	h=subject:to:cc:references:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=kNyF8/e9n0HaH7iNw5yqgELcNU7rsClNmPSLiqVugcY=;
	b=jfkL+7bPH03PBgBrPu+6GikTpwRXToIz82Gv0jI+lU0aucn9zfnca2gs
	ACM+ChuY+KCD+3TgI91EovyUcgMgQa7sL5bT0gKXyXzMEH3Wa41wXhRa5
	yjJOpAj6MusbX4+p8L4H/1OkX7GDk8wJRuxiN1oMwkoT5z51l0haUwAHd
	iSzcyBGUr+2mq5y7s/BzrfZNdkPHXluyUM8119qVK3IAu9+wqOVg3HU7C
	dPLTNJLl9BXJoTpRh0FAhTNY8ANBpe36Fi8DHDQtEmMyXx9ibuegci05V
	G0O2UwmeihhK9uu9kFf4UHeGnlG1GADZ8s7gsYdtIS/OkbJK6r5BAZpz0 g==;
X-IronPort-AV: E=Sophos;i="5.63,483,1557187200"; d="scan'208";a="30098568"
IronPort-PHdr: =?us-ascii?q?9a23=3Aj4WAeBLUuKhZ92F09dmcpTZWNBhigK39O0sv0r?=
	=?us-ascii?q?FitYgXLvj9rarrMEGX3/hxlliBBdydt6sezbeO+Pm5ByQp2tWoiDg6aptCVh?=
	=?us-ascii?q?sI2409vjcLJ4q7M3D9N+PgdCcgHc5PBxdP9nC/NlVJSo6lPwWB6nK94iQPFR?=
	=?us-ascii?q?rhKAF7Ovr6GpLIj8Swyuu+54Dfbx9HiTagf79+NhW7oRneusULnIdvK7s6xw?=
	=?us-ascii?q?fUrHdPZ+lY335jK0iJnxb76Mew/Zpj/DpVtvk86cNOUrj0crohQ7BAAzsoL2?=
	=?us-ascii?q?465MvwtRneVgSP/WcTUn8XkhVTHQfI6gzxU4rrvSv7sup93zSaPdHzQLspVz?=
	=?us-ascii?q?mu87tnRRn1gyocKTU37H/YhdBxjKJDoRKuuRp/w5LPYIqIMPZyZ77Rcc8GSW?=
	=?us-ascii?q?ZEWMteWTZBAoehZIURCeQPM/tTo43kq1YOqRayAA+hD/7txDBVnH/7xbA03f?=
	=?us-ascii?q?ovEQ/G3wIuEdwBv3vWo9rpO6kfSvy1wavSwDnfc/9b1zXw5Y7VeR4hu/GMWr?=
	=?us-ascii?q?dwfNLMx0kzCQzFllWQppLjPziIy+oNtnKU7+5kVe2xi28stgZ8oiOyycc3kY?=
	=?us-ascii?q?TJmoIUxUzE9SV+2oo1I8a4R1Rhbd6rF5tQqTiXOo1rSc0hW2FloDs2x7IJtJ?=
	=?us-ascii?q?KhfCUG1Y4rywDQZvCZaYSE/xTuX/uLLzhinnJqYre/ig638Uin1+LzSNG50E?=
	=?us-ascii?q?1PripZitnMsW0N1wDL5siHVPR9+kCh1C6T1w/J8OFEIF00lbHBJ549wr8/ip?=
	=?us-ascii?q?oTsUPZEi/whEr2l7OZel8h+uip7+TrerTmppmCOI9okgzyL6sjl8OlDek4Lw?=
	=?us-ascii?q?QCRXaX9Oui2LH54EH1WLBKgec3kqndvpDaP8MbpquhDg9Oz4kj8A2yDyum0d?=
	=?us-ascii?q?sEnXkHK0hJeBScj4fzIV3OL/f4Demnj1S2jDhr3+zGPqHmApjVLHjDlbDhfa?=
	=?us-ascii?q?xn605d0wo+1tZf6IhRCr4fIfL/QEjxtMbXDhUhKQy73/7nCMlh1oMZQW+PGr?=
	=?us-ascii?q?WWML7WsVKT/uIgOfSMZIsMtDb4LPgl4OTugmEjlVABeqmp2IMdaGqkEfR+P0?=
	=?us-ascii?q?WZfX3sj88aEWgUugo+TerqiECNUDNIeXayULwz5ishBIKlE4jDXIatj6KF3C?=
	=?us-ascii?q?uhGZ1WfG9GAEiWEXj0b4WER+sMaCWKL89lkzwEU6WhSoA42RG1qgD116dnLv?=
	=?us-ascii?q?DV+i0EtZPvzd115+rOmhEv8Tx7Ed+Q03+CT25qhGMEXTw2075loUx71FiD1b?=
	=?us-ascii?q?J0g/tCFdxc//lJSBs1NYbAz+xmDND/QgbBfsqVSFahWdipGzQxQcgtzNAUe0?=
	=?us-ascii?q?Z9GsmigQrH3yawBb8aiaCLDoQu8q3Ax3jxO9p9y3He2akikVYpXNBPOnGhhq?=
	=?us-ascii?q?549AjeHJLGk0WDl6atcKQc3TPN9GKZwWqJpkFYXxZ6Ub/ZUnAHekvWsdP561?=
	=?us-ascii?q?vZT7CwE7QnPRVOxNWCKqRQbt3piVVHRPH5NNvCZGKxnn+6BQyUybOUcIrqZ2?=
	=?us-ascii?q?Id0T3fCEgDkwAT+2yKNQo5BiehuW3eCiduGkzpY0737eZxsnW7TkgyzwGLc0?=
	=?us-ascii?q?Juzb619gQJivybTvMZxqgEtzs5qzVoAFa92MrbBMaaqAp6YqpdYcgw4Exb2m?=
	=?us-ascii?q?LZrQN9I5KgL6R8iV4Eagh4o1nh2w9rBYVHlMggtGkqwxZqKaKEzFNBcCuV3Z?=
	=?us-ascii?q?X3Or3NNmny+xava6vN117C0NaW4KAP6PE5q1X+uQGlDE0i829o09NNyXuT+o?=
	=?us-ascii?q?3KDBYOUZL2Sks38xl6p7fHYigy/o/bz2BsPrS1sj/ewN8pHvUqxQugf9hFLK?=
	=?us-ascii?q?OIDhP9E8ofB5vmFOt/uVGsYwlMGedI7q8vd5ekcvycwq+wFOBpmT+ny2Nd79?=
	=?us-ascii?q?Y5mmSN/Cp7TufTl7gfyveT3UPTUTfyll6n6OjriItEYncUBWP5xi/6Ut1/fK?=
	=?us-ascii?q?p3KL0XBH+uLsv//dB3g5rgSjYM71K4L08X08+uPxyJZhry2hMGhhdfmmCuhS?=
	=?us-ascii?q?btl288qDoutKfKmXWTkuk=3D?=
X-IPAS-Result: =?us-ascii?q?A2CcAADjyShd/wHyM5BlHAEBAQQBAQcEAQGBVgQBAQsBg?=
	=?us-ascii?q?WwqgW6ERJMwAQEBAQEBBoEJCCWJYIl9hxgJAQEBAQEBAQEBNAECAQGEQAKCV?=
	=?us-ascii?q?iM3Bg4BAwEBAQQBAQEBBAEBbIVIgjopAYJnAQUjBBE2CxALDgoCAiYCAlcGA?=
	=?us-ascii?q?QwIAQGCXz+BdxSsOn8zhUeDLYFHgQwoAYteF3iBB4E4DIJfPodOglgElHGVc?=
	=?us-ascii?q?QmCG4IfkWYGG5gHLY0HmVsigVgrCAIYCCEPO4JtgneOKSMDgTYBAY9iAQE?=
Received: from tarius.tycho.ncsc.mil ([144.51.242.1])
	by emsm-gh1-uea11.NCSC.MIL with ESMTP; 12 Jul 2019 18:02:19 +0000
Received: from moss-pluto.infosec.tycho.ncsc.mil (moss-pluto [192.168.25.131])
	by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id
	x6CI2HsL016590; Fri, 12 Jul 2019 14:02:17 -0400
Subject: Re: [RFC PATCH] security, capability: pass object information to
	security_capable
To: James Morris <jmorris@namei.org>, Nicholas Franck <nhfran2@tycho.nsa.gov>
References: <20190712173404.14417-1-nhfran2@tycho.nsa.gov>
	<alpine.LRH.2.21.1907130347010.1509@namei.org>
From: Stephen Smalley <sds@tycho.nsa.gov>
Message-ID: <3605eb1a-fb1c-8933-b1e1-a60e54fb1e1c@tycho.nsa.gov>
Date: Fri, 12 Jul 2019 14:02:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.21.1907130347010.1509@namei.org>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Fri, 12 Jul 2019 18:02:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Fri, 12 Jul 2019 18:02:52 +0000 (UTC) for IP:'214.24.24.87'
	DOMAIN:'ucol19pa14.eemsg.mail.mil'
	HELO:'ucol19pa14.eemsg.mail.mil' FROM:'sds@tycho.nsa.gov' RCPT:''
X-RedHat-Spam-Score: -2.401  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 214.24.24.87 ucol19pa14.eemsg.mail.mil 214.24.24.87
	ucol19pa14.eemsg.mail.mil <sds@tycho.nsa.gov>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 12 Jul 2019 16:03:15 -0400
Cc: mortonm@chromium.org, john.johansen@canonical.com, selinux@vger.kernel.org,
	luto@amacapital.net, linux-security-module@vger.kernel.org,
	"linux-audit@redhat.com" <linux-audit@redhat.com>, serge@hallyn.com
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Fri, 12 Jul 2019 20:03:32 +0000 (UTC)

On 7/12/19 1:50 PM, James Morris wrote:
> On Fri, 12 Jul 2019, Nicholas Franck wrote:
> 
>> +	case LSM_AUDIT_DATA_CAP: {
>> +		const struct inode *inode;
>> +
>> +		if (a->u.cap_struct.cad) {
>> +			switch (a->u.cap_struct.cad->type) {
>> +			case CAP_AUX_DATA_INODE: {
>> +				inode = a->u.cap_struct.cad->u.inode;
>> +
>> +				audit_log_format(ab, " dev=");
>> +				audit_log_untrustedstring(ab,
>> +					inode->i_sb->s_id);
>> +				audit_log_format(ab, " ino=%lu",
>> +					inode->i_ino);
>> +				break;
>> +			}
>> +			}
>> +		}
>> +		audit_log_format(ab, " capability=%d ", a->u.cap_struct.cap);
>>   		break;
> 
> Will this break any existing userspace log parsers?

I'm hoping not given that we are only adding auxiliary fields and those 
are already defined for other AVC audit messages.  ausearch appeared to 
work fine.  Added the linux-audit mailing list to the cc line to get 
their view.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
