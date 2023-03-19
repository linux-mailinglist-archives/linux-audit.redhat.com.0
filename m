Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D71EC6BFF0A
	for <lists+linux-audit@lfdr.de>; Sun, 19 Mar 2023 03:17:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679192267;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=4iukah/9vfk3A1GFE7TNV0PJeR2UArQmxcEFyZBvHp8=;
	b=MsZqRpiIEDofjyaK1Dymw75c+uhwUEourc60M0qo5+MWNAC9W6s3RtZGPLIiqe1NvOSbmE
	tWS6/pikcEOBFcch439aDcUR10L3UtaggDsYg8TEfyuSCpLkIOy/8AA+xJ40C9Noa9+tjK
	SLMf2Ev+n/s8s2V0Yh43Y6mY9Qhsq50=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-L1_2dOghPkqsEjgOc7tNUA-1; Sat, 18 Mar 2023 22:17:45 -0400
X-MC-Unique: L1_2dOghPkqsEjgOc7tNUA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 050B91C05AFC;
	Sun, 19 Mar 2023 02:17:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ACDF440C6E67;
	Sun, 19 Mar 2023 02:17:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1ADDF1946A52;
	Sun, 19 Mar 2023 02:17:34 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CBF771946588 for <linux-audit@listman.corp.redhat.com>;
 Sun, 19 Mar 2023 02:17:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A052E2166B29; Sun, 19 Mar 2023 02:17:33 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 987432166B26
 for <linux-audit@redhat.com>; Sun, 19 Mar 2023 02:17:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 752B429AA389
 for <linux-audit@redhat.com>; Sun, 19 Mar 2023 02:17:33 +0000 (UTC)
Received: from sonic309-22.consmr.mail.ne1.yahoo.com
 (sonic309-22.consmr.mail.ne1.yahoo.com [66.163.184.148]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-482-uUKYRH67Muq0Jw6EXdbP4w-1; Sat,
 18 Mar 2023 22:17:31 -0400
X-MC-Unique: uUKYRH67Muq0Jw6EXdbP4w-1
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1679192250; bh=5rCdjTM19ba3CWPxBRsYVG3wxVC+MC//07OBHo5Ilb5=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=VWJbZ3ixZwwDv/3Z82Rs84jOhVB9iXfv4JJstW4tmXWJbOj4raLEFsRokh/RTHnxRehiuG3Pc5oOwlxYTZhQ2JMOfeNnJEv9S1Bhpjtwb5Fb8uT5Mxnzvj5e7BDkDriOAPCWWBxfSCYODRvgkaMsGDroj3jG79DrCDYW9wuaszStcTuVoj55nALHrkfAKxxafG2bAXUqmxXVhFwujxOMtHO15JAqXUK7j1ra/r6nBpFirCSzrmi1Kc8EPHumcW0sfm441+kOqO9PljA6baJ9idG8AbJSmFgP3VWMkggNfiy1y/9Bb/R+O+lBttMhRrcTQO/nFbwY7o92NklvST0oRg==
X-YMail-OSG: TUwWVY0VM1nwQ6nRYf660vkCNqkzUhbES3BdAmNzgWCheuhzY.u_BnNiY7UPqHS
 I.ni4vchuWoALqml5T_di8yYQCVRiPVibSCmWP7E1fvdWZRty75UBVwwP6xVztSkijB00S06KMRv
 sTdF9gNOyEJmMTVRG3wSbY1A24DaBJESfxvnhKzNHFaFUDgTKzE.ODETV9lGRSWohDVnMiH0bYZd
 s6.3kKZksk_NDvaVo9ToHbbcLsgihkEZP_99BMROm8P1cYQMuRMtI21mC9w_SyxC4Yr3ia6mKhzs
 nPSQ_MJg4ApJsYZigZA.PzOj6CNxYLS86V4.ldhIBW5q8oatUpTYZrtHaYuU3G5euYMIDhBQFA6T
 RjR.6.SfF4KkA7raYQobcBpp1ZZwYn.NGh4RWIpuN9b3CHRkbAhdxoPL1RNDVsWXeP_MnEPddevV
 bHS.nZ9h3a9TM7ukPEcZSQnDg6UVTO2J24FN8bW50luPrNYUDnIUktCitCKZVJhZENZnY9e0ckdE
 S2yz7QWTqN4DtB94tjIQIMV1nlq26YkaByCKBNzihGGOSjH9p6AWiCUfpWBS2Lwfrr2.rtvHzqOR
 8f6Ik4WNr_V3PRwCo4URcpESMXIEc5pALftocBUvhHWydb2.r67hrP0LeIEommtOBGCIy2hDeSjs
 e.BCwIgF_lL1tMLeQK3iyta2mhKP9nukMlBnC6zwAkrg2ymwkhLyENUTRm1XE.KkCz9A1QMciYND
 ReFpUgzJ8yRky7FiVS8t45imoyKjWSCmMVer7wPf7AQZtSpEd.3hcEHgGDhyaFTtMrMRXDJdV59y
 F_1Fj8vLdz2dR.AW5cG.ruvvJ6O3VL1MZEcVQJYies7ft7osP7_aBnMyW03k8cKKG_DAjRE9li1_
 5EHEQNETZljfW5tvIldkTYGej6IQ_tJsDevcufGncqVUxLUgffaFEmuTiWfKQVxLz14bNbvwHZbY
 VOajazxPKGXbqRP_ib638fezLbDETySIOdZttsnwpL31kHizpuAFHqeEyULl_cQTDMjZUioTsQ2w
 6jkzSdQiOTbNY5ULumUHP.tFTE1Qu3Gg6K0SrAhdIF1DqKiFu3BU2YSFsUfTs477XW05QvbF8AK6
 XuTW6Ns.N_VU49L4Q1GYHFNRBi3.vkfmXfysXDFcsKQkIjayh5LXYKLVrxqhhNuq28n0Bfrs9Zut
 S6x1ZgOeB8KQsBpyK2VmfNuCddOhnsSE1i7mWg4NJXonIHJrpyvAVr5LDHhHMmZb51mPh5zkoNHP
 pjnMRiC5sDx9LkNavdygjpW_0ZIjp0noRzJanBx9qxJMPOt1KQUvrEIrYt3Tgau0j_hG9.MARJqW
 C_Sa0z3YMok1zwm7IDKeNZTv32Ys3EoB0LCbUWW0RbcfrZZcURSAhN6J_jjEpHLIfyarSWWKMFGR
 nJUcUTkDyPDjUUNTJDem9hzDvFDvAbrnammV4Im563wVMgjbGDv__bQkMBCKVmKtn7l4grJ_t55I
 MpslmfRWWI6MGvP42EVkFrgMN.g7rROr8T.DkY6Vud7RF2Z8xpNhQvY1_A27Q9xfHYsdbyUdV4DA
 IgHT0aBu16tOlIoVOyYxRcPIVxepuNBr7m.6PedQZWOv4xICUwiU6mG9sc7xZbdow2XDFLgjQumz
 WFYqx2lZEuk9_U9xfp1QSWZwfrTy7o3kcaRj.5HvcQlRaR2ZgdEgR2POpqNUYJgjSR2jGSNDp8hJ
 qpcXwAXys6Edu991f.Nw6k9KWXwEV9Qn05D50tSoqj3fjyA5LSg8C8wikpZWSuhcVj2sjnB7T8CB
 48AcpCn9dGD1ZgdiYDu3vy0fDQfqZkyB3bpBaTO8nPwqVBMdTodtn32N.0SMjleET9x9UcifIOeP
 m1gxNl4V3iHBc.957PESEcsKDU44MLph3Ge.LpTRrPybDlckBWXXWaJ9Rtg1DTezDNhe.N62f5sm
 N6i18naULt56XHf7dOnvyAkCDNv.Un_UyDqW2yZl6JhLU8izi2ysw5NkRjwDOnbBOCs.FiF8ZDKv
 J0By.Vl2EY6idZQkdfuZyIh.uPD2TaL_6LzdNPTBQkNq0DONt3LHjNbskl6ALblYGTtomLD09Brp
 6D0Sfv9CaXQo8wAjRUSogFo4qnjD_huYBjv9AnHLvjI8yRDtrtFU3_Oo_0nS7RplTt9btv96fplu
 P5pFlQDpi_C5QWxydKviFSc7nt3XCXa6QOrv9IQ5y5_bj9tYgCbT4JyjZEbZXo1_HSosK58i7TSn
 jG..ZyuA2.26ASKkWKl1MLA6yYmOyCXG9
X-Sonic-MF: <joe_wulf@yahoo.com>
X-Sonic-ID: 23145cea-76c1-4742-bac7-669b80b34524
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.ne1.yahoo.com with HTTP; Sun, 19 Mar 2023 02:17:30 +0000
Date: Sun, 19 Mar 2023 02:17:26 +0000 (UTC)
From: Joe Wulf <joe_wulf@yahoo.com>
To: "linux-audit@redhat.com" <linux-audit@redhat.com>, 
 "Christiansen, Edward - 0992 - MITLL" <edwardc@ll.mit.edu>
Message-ID: <1457482559.2089618.1679192246905@mail.yahoo.com>
In-Reply-To: <BN0P110MB1210873AA2E95F81D143AD299C829@BN0P110MB1210.NAMP110.PROD.OUTLOOK.COM>
References: <BN0P110MB1210873AA2E95F81D143AD299C829@BN0P110MB1210.NAMP110.PROD.OUTLOOK.COM>
Subject: Re: run script after auditd rotates logs
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============6282350779895184930=="

--===============6282350779895184930==
Content-Type: multipart/alternative; 
	boundary="----=_Part_2089617_428644855.1679192246904"

------=_Part_2089617_428644855.1679192246904
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

 Here is what I've done to manage audit log files in systems I build.You ca=
n leverage this, and add your other things after the 'service auditd rotate=
'.Would that work for you?
-Joe

#!/bin/bash

# Reference:=C2=A0 https://access.redhat.com/solutions/661603
PATH=3D'/sbin:/bin:/usr/sbin:/usr/bin'

# auditd log rotation -- This file located in /etc/cron.daily/auditd.cron

FORMAT=3D'+%Y%m%d_%H%M%S'=C2=A0 # Customize timestamp format as desired, pe=
r 'man date'.
COMPRESS=3D'gzip'=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # C=
hange to bzip2 or xz, if desired.
Cext=3D'gz'=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Change to match file EXTENSION for the compre=
ssion used.
KEEP=3D10=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Number of compressed log files to ke=
ep.
ROTATE_TIME=3D30=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 # Amount of time in seconds to wait for auditd to rotate its logs; adju=
st this as necessary.

function rename_and_compress_old_logs() { for file in $(find /var/log/audit=
/ -type f -regextype posix-extended -regex=C2=A0 '.*audit.log.[0-9]{1,}$');=
 do
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 timestamp=3D"$(ls -l --time-s=
tyle=3D${FORMAT} ${file} | awk '{print $6}')"
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 newfile=3D"${file%.[0-9]}.${t=
imestamp}"
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mv ${file} ${newfile}
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${COMPRESS} -9 ${newfile}
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 done; }

function delete_old_compressed_logs() { rm -f $(find /var/log/audit/ -regex=
type posix-extended -regex '.*audit\.log\..*(xz|gz|bz2)$' | sort -n | head =
-n -${KEEP}) 2>/dev/null; }

rename_and_compress_old_logs

service auditd rotate
EV=3D"$?"
if [ "${EV}" !=3D 0 ]; then
=C2=A0=C2=A0=C2=A0=C2=A0 /usr/bin/logger -t auditd "FAILURE ALERT from /etc=
/cron.daily/auditd.cron 'service auditd rotate' exited ABNORMALLY with exit=
 value(${EV})."
else
=C2=A0=C2=A0=C2=A0=C2=A0 /usr/bin/logger -t auditd "cron.daily:=C2=A0 Succe=
ssful rotation of: /var/log/audit/audit.log."
fi

sleep ${ROTATE_TIME}
rename_and_compress_old_logs
chmod 0600 /var/log/audit/audit.log
chmod 0400 /var/log/audit/audit.log*.${Cext}
delete_old_compressed_logs
unset FORMAT COMPRESS Cext KEEP ROTATE_TIME file timestamp newfile EV

exit 0






    On Saturday, March 18, 2023 at 10:57:23 AM EDT, Christiansen, Edward - =
0992 - MITLL <edwardc@ll.mit.edu> wrote: =20
=20
 I would like to know if there is a way to tell auditd to run a script or=
=20
command after it rotates its logs.=C2=A0 I can do this with logrotate, but =
would=20
much prefer something native to auditd.=C2=A0 I spent some toime with Googl=
e and=20
found only logrotate solutions.

Thanks,

Ed Christiansen
Millstone Hill SysAdmin
--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit
  
------=_Part_2089617_428644855.1679192246904
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydpe63984e5yahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px=
;"><div></div>
        <div dir=3D"ltr" data-setdir=3D"false">Here is what I've done to ma=
nage audit log files in systems I build.</div><div dir=3D"ltr" data-setdir=
=3D"false">You can leverage this, and add your other things after the 'serv=
ice auditd rotate'.</div><div dir=3D"ltr" data-setdir=3D"false">Would that =
work for you?</div><div dir=3D"ltr" data-setdir=3D"false"><br></div><div di=
r=3D"ltr" data-setdir=3D"false">-Joe<br></div><div dir=3D"ltr" data-setdir=
=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false"><div><font size=
=3D"2" face=3D"courier new, courier, monaco, monospace, sans-serif">#!/bin/=
bash<br><br># Reference:&nbsp; https://access.redhat.com/solutions/661603<b=
r>PATH=3D'/sbin:/bin:/usr/sbin:/usr/bin'<br><br># auditd log rotation -- Th=
is file located in /etc/cron.daily/auditd.cron<br><br>FORMAT=3D'+%Y%m%d_%H%=
M%S'&nbsp; # Customize timestamp format as desired, per 'man date'.<br>COMP=
RESS=3D'gzip'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Chang=
e to bzip2 or xz, if desired.<br>Cext=3D'gz'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Change to mat=
ch file EXTENSION for the compression used.<br>KEEP=3D10&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; # Number of compressed log files to keep.<br>ROTATE_TIME=3D30&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Amount of time in=
 seconds to wait for auditd to rotate its logs; adjust this as necessary.<b=
r><br>function rename_and_compress_old_logs() { for file in $(find /var/log=
/audit/ -type f -regextype posix-extended -regex&nbsp; '.*audit.log.[0-9]{1=
,}$'); do<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; timestamp=3D"$(l=
s -l --time-style=3D${FORMAT} ${file} | awk '{print $6}')"<br>&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; newfile=3D"${file%.[0-9]}.${timestamp}"<br=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mv ${file} ${newfile}<br>&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${COMPRESS} -9 ${newfile}<br>&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; done; }<br><br>function delete_old_compressed_logs() { r=
m -f $(find /var/log/audit/ -regextype posix-extended -regex '.*audit\.log\=
..*(xz|gz|bz2)$' | sort -n | head -n -${KEEP}) 2&gt;/dev/null; }<br><br>ren=
ame_and_compress_old_logs<br><br>service auditd rotate<br>EV=3D"$?"<br>if [=
 "${EV}" !=3D 0 ]; then<br>&nbsp;&nbsp;&nbsp;&nbsp; /usr/bin/logger -t audi=
td "FAILURE ALERT from /etc/cron.daily/auditd.cron 'service auditd rotate' =
exited ABNORMALLY with exit value(${EV})."<br>else<br>&nbsp;&nbsp;&nbsp;&nb=
sp; /usr/bin/logger -t auditd "cron.daily:&nbsp; Successful rotation of: /v=
ar/log/audit/audit.log."<br>fi<br><br>sleep ${ROTATE_TIME}<br>rename_and_co=
mpress_old_logs<br>chmod 0600 /var/log/audit/audit.log<br>chmod 0400 /var/l=
og/audit/audit.log*.${Cext}<br></font><div><font size=3D"2" face=3D"courier=
 new, courier, monaco, monospace, sans-serif">delete_old_compressed_logs</f=
ont></div></div><div dir=3D"ltr" data-setdir=3D"false"><div><font size=3D"2=
" face=3D"courier new, courier, monaco, monospace, sans-serif"><br></font><=
/div><div dir=3D"ltr" data-setdir=3D"false"><font size=3D"2" face=3D"courie=
r new, courier, monaco, monospace, sans-serif">unset FORMAT COMPRESS Cext K=
EEP ROTATE_TIME file timestamp newfile EV<br></font></div><div><font size=
=3D"2" face=3D"courier new, courier, monaco, monospace, sans-serif"><br></f=
ont></div><div><font size=3D"2" face=3D"courier new, courier, monaco, monos=
pace, sans-serif">exit 0</font></div><br></div><div><br></div></div><div di=
r=3D"ltr" data-setdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"f=
alse"><br></div><div dir=3D"ltr" data-setdir=3D"false"><br></div><div dir=
=3D"ltr" data-setdir=3D"false"><br></div><div><br></div>
       =20
        </div><div id=3D"ydp83b2f85dyahoo_quoted_9784689520" class=3D"ydp83=
b2f85dyahoo_quoted">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div>
                    On Saturday, March 18, 2023 at 10:57:23 AM EDT, Christi=
ansen, Edward - 0992 - MITLL &lt;edwardc@ll.mit.edu&gt; wrote:
                </div>
                <div><br></div>
                <div><br></div>
                <div><div dir=3D"ltr">I would like to know if there is a wa=
y to tell auditd to run a script or <br></div><div dir=3D"ltr">command afte=
r it rotates its logs.&nbsp; I can do this with logrotate, but would <br></=
div><div dir=3D"ltr">much prefer something native to auditd.&nbsp; I spent =
some toime with Google and <br></div><div dir=3D"ltr">found only logrotate =
solutions.<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">Thanks,<br>=
</div><div dir=3D"ltr"><br></div><div dir=3D"ltr">Ed Christiansen<br></div>=
<div dir=3D"ltr">Millstone Hill SysAdmin<br></div>--<br>Linux-audit mailing=
 list<br><a href=3D"mailto:Linux-audit@redhat.com" rel=3D"nofollow" target=
=3D"_blank">Linux-audit@redhat.com</a><br><a href=3D"https://listman.redhat=
.com/mailman/listinfo/linux-audit" rel=3D"nofollow" target=3D"_blank">https=
://listman.redhat.com/mailman/listinfo/linux-audit</a><br></div>
            </div>
        </div></body></html>
------=_Part_2089617_428644855.1679192246904--

--===============6282350779895184930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============6282350779895184930==--

